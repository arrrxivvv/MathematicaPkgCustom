(* ::Package:: *)

(* ::Title:: *)
(*StrIOManip*)


(* ::Text:: *)
(*Utility for printing strings, numbers etc*)


BeginPackage["StrIOManip`"]


floatToStrWith0::Usage["floatToStrWith0[xFloat_,numDigit_]"];


Begin["`Private`"]


(* ::Input::Initialization:: *)
floatToStrWith0[xFloat_,numDigit_]:=
If[xFloat==0.0,
0,
NumberForm[xFloat,{\[Infinity],numDigit}]];


End[]


EndPackage[]
