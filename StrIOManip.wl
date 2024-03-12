(* ::Package:: *)

(* ::Title:: *)
(*StrIOManip*)


(* ::Text:: *)
(*Utility for printing strings, numbers etc*)


BeginPackage["StrIOManip`"]


floatToStrWith0::Usage["floatToStrWith0[xFloat_,numDigit_]"];


floatIntRemoveTrailing::Usage["floatIntRemoveTrailing[xFLoat_]"];


Begin["`Private`"]


(* ::Input::Initialization:: *)
floatToStrWith0[xFloat_,numDigit_]:=
If[xFloat==0.0,
0,
NumberForm[xFloat,{\[Infinity],numDigit}]];


(* ::Input::Initialization:: *)
floatIntRemoveTrailing[xFloat_]:=
Map[If[#==Round[#],Round[#],#]&,xFloat,-1];


End[]


EndPackage[]
