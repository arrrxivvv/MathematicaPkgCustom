(* ::Package:: *)

(* ::Title:: *)
(*FileSaving*)


BeginPackage["FileSaving`"]


Options[saveStrLstDelim]={"Delimiter"->"\n"};
saveStrLstDelim;
Options[saveStrLstDelimPut]={"Delimiter"->"\n"};
saveStrLstDelimPut;


Begin["Private`"]


(* ::Input::Initialization:: *)
saveStrLstDelim[fName_,strLst_,OptionsPattern[]]:=
Module[{ss=OpenWrite[fName]},
Do[WriteString[ss,strLst[[ii]],OptionValue["Delimiter"]],{ii,Length[strLst]}];
Close[fName]];


(* ::Input::Initialization:: *)
saveStrLstDelimPut[fName_,strLst_,OptionsPattern[]]:=
Module[{ss=OpenWrite[fName]},
Do[PutAppend[OutputForm[strLst[[ii]]],fName],{ii,Length[strLst]}];
Close[fName];];


End[]


EndPackage[]
