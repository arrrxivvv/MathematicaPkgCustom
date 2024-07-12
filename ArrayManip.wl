(* ::Package:: *)

(* ::Title:: *)
(*ArrayManip*)


(* ::Text:: *)
(*Array manipulation utilites*)


BeginPackage["ArrayManip`"];


reverseDims::Usage["reverseDims[arr_] reverses the dimensions of arr"];
squeezeDims::Usage["squeezeDims[arr_] removes singleton dimensions of arr"];
mapThreadOutput;
Wrap0;
shAvgWrap;
vectOfArrReverseDims
meshGrid;


Begin["`Private`"];


reverseDims[arr_]:=Transpose[arr,Reverse[Table[d,{d,1,ArrayDepth[arr]}]]];


squeezeDims[arr_]:=ArrayReshape[arr, Dimensions[arr] ~DeleteCases~ 1];


(* ::Input::Initialization:: *)
mapThreadOutput[out_,dimWrap_:1]:=Transpose[out,Range[2,dimWrap+1]~Join~{1}];


Wrap0[arr_]:=arr~Join~{arr[[1]]};


(* ::Input::Initialization:: *)
vectOfArrReverseDims[arr_]:=Table[reverseDims[arr[[iV]]],{iV,Length[arr]}];


(* ::Input::Initialization:: *)
shAvgWrap[arr_]:=Module[{ln=Dimensions[arr][[1]],arr1d,it},
arr1d=Table[0,ln];
For[it=1,it<=ln,it++,
arr1d+=RotateLeft[arr[[it]],it-1];
];
arr1d
];


(* ::Input::Initialization:: *)
meshGrid[xLst_,yLst_]:={ConstantArray[xLst,Length[yLst]]\[Transpose],ConstantArray[yLst,Length[xLst]]};


End[];


EndPackage[];
