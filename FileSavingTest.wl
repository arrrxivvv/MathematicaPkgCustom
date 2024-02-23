(* ::Package:: *)

(* ::Title:: *)
(*FileSavingTest*)


BeginPackage["FileSavingTest`"]


Options[saveStrLstDelimPut1]={"Delimiter"->"\n"};
saveStrLstDelimPut1;


Begin["Private`"]


(* ::Input::Initialization:: *)
saveStrLstDelimPut1[fName_,strLst_,OptionsPattern[]]:=
Module[{ss=OpenWrite[fName]},
PutAppend[strLst,fName];
Close[fName];];


End[]


EndPackage[]
