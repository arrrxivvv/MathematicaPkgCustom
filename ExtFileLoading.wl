(* ::Package:: *)

(* ::Title:: *)
(*ExtFileLoading*)


(* ::Text:: *)
(*functions to for external file IO with Julia, Python, and text files*)


BeginPackage["ExtFileLoading`"];


Needs["ArrayManip`"];


(* ::Section:: *)
(*Public*)


(* ::Subsection:: *)
(*read functions*)


readPython::Usage="readPython[f_] reads npy files with file name f";


readJulia;
readJuliaVar;
readJuliaVarSq;
readJuliaVarDimFixed;
readJuliaVarSqDim;


readTxtLastLine;


(* ::Section:: *)
(*Private*)


Begin["`Private`"];


(* ::Subsection:: *)
(*sessions initiation*)


sessPy=StartExternalSession["Python"];
ExternalEvaluate[sessPy, "sys.path.insert(1, '')"];
ExternalEvaluate[sessPy,"import numpy as np"];


sessJul=StartExternalSession["Julia"];
ExternalEvaluate[sessJul,"using JLD, JLD2"];


(* ::Subsection:: *)
(*String manip for file names*)


(* ::Input::Initialization:: *)
Py[ex_]:=ExportString[ex,"PythonExpression"];
ArrToStrPyOld[arr_]:="["<>StringTrim@StringJoin[", "<>ToString[#,InputForm]&/@arr]<>"]";
ArrToStrPy[arr_]:="["<>StringJoin[Table[ToString[arr[[n]]]<>If[n<Length[arr],", ",""],{n,1,Length[arr]}]]<>"]";


(* ::Input::Initialization:: *)
readPython[filename_]:=Normal[ExternalEvaluate[sessPy,
"np.load("<>Py[Directory[]<>"\\\\"<>filename]<>")"]];


(* ::Subsection:: *)
(*read functions*)


(* ::Input::Initialization:: *)
readJulia[fName_]:=Normal[ExternalEvaluate[sessJul,
"load("<>Py[Directory[]<>"\\\\"<>fName]<>")"]];


(* ::Input::Initialization:: *)
readJuliaVar[fName_,var_]:=ExternalEvaluate[sessJul,"load("<>Py[Directory[]<>"\\"<>fName]<>",\""<>var<>"\")"];


(* ::Input::Initialization:: *)
readJuliaVarSq[fName_,var_]:=squeezeDims[readJuliaVar[fName,var]];


(* ::Input::Initialization:: *)
readJuliaVarDimFixed[fName_,var_]:=squeezeDims[reverseDims[readJuliaVar[fName,var]]];


(* ::Input::Initialization:: *)
readJuliaVarSqDim[fName_,var_]:=squeezeDims[readJuliaVar[fName,var]];


(* ::Input::Initialization:: *)
fileExistJulia[fName_]:=ExternalEvaluate[sessJul,"isfile(\""<>fName<>"\")"];


(* ::Subsection:: *)
(*File stream*)


(* ::Input::Initialization:: *)
readTxtLastLine[fName_]:=
Module[{inStr=OpenRead[fName]},
SetStreamPosition[inStr,Infinity];
If[StreamPosition[inStr]==0,
Return[""],
SetStreamPosition[inStr,StreamPosition[inStr]-1];
If[StreamPosition[inStr]==0,
Return[""],
If[Read[inStr,Character]=="\n",
SetStreamPosition[inStr,StreamPosition[inStr]-2]
];
While[StreamPosition[inStr]>0,
If[Read[inStr,Character]=="\n",
Break[],
SetStreamPosition[inStr,StreamPosition[inStr]-2]
];
];
Return[ReadLine[inStr]];
]
]
];


End[];


EndPackage[];
