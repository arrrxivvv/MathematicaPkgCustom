(* ::Package:: *)

(* ::Title:: *)
(*ExternalEvaluatorFuncs*)


(* ::Text:: *)
(*functions to for external file IO with Julia, Python, and text files*)


BeginPackage["ExternalEvaluatorFuncs`"];


Needs["ExternalEvaluatorLoad`"];


(* ::Section:: *)
(*Public*)


(* ::Subsection:: *)
(*Sessions Directory Change*)


cdJulia;
addJuliaPathSrc;


(* ::Subsection:: *)
(*Evaluate Julia*)


evalJulia;


(* ::Subsection:: *)
(*Julia Load Packages*)


juliaLoadPkg;


(* ::Section:: *)
(*Private*)


Begin["`Private`"];


(* ::Subsection:: *)
(*String Escape Sequence Handling*)


(* ::Input::Initialization:: *)
Py[str_]:=ExportString[str,"PythonExpression"];


(* ::Subsection:: *)
(*Session Directory Change*)


(* ::Input::Initialization:: *)
cdJulia[dir_]:=ExternalEvaluate[sessJul,StringTemplate["cd(``)"][Py[dir]]];


(* ::Input::Initialization:: *)
addJuliaPathSrc[]:=ExternalEvaluate[sessJul,"push!(LOAD_PATH,\"./src\")"];


(* ::Subsection:: *)
(*Julia Eval*)


(* ::Input::Initialization:: *)
evalJulia[comm_]:=ExternalEvaluate[sessJul,comm];


(* ::Subsection:: *)
(*Julia Load Packages*)


(* ::Input::Initialization:: *)
juliaLoadPkg[pkgName_]:=ExternalEvaluate[sessJul,ToString@StringForm["using ``",pkgName]];


End[];


EndPackage[];
