(* ::Package:: *)

(* ::Title:: *)
(*ArrayProcess*)


(* ::Text:: *)
(*Array processing utilities*)


BeginPackage["ArrayProcess`"];


genAutoCorr;


Begin["`Private`"];


(* ::Input::Initialization:: *)
genAutoCorr[arr_]:=Re[InverseFourier[Abs[Fourier[arr]]^2]];


End[];


EndPackage[];
