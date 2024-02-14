(* ::Package:: *)

(* ::Title:: *)
(*ExternalEvaluatorLoad*)


(* ::Text:: *)
(*functions to for external file IO with Julia, Python, and text files*)


BeginPackage["ExternalEvaluatorLoad`"];


(* ::Section:: *)
(*Public*)


sessPy;
sessJul;


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


End[];


EndPackage[];
