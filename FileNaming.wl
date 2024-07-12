(* ::Package:: *)

(* ::Title:: *)
(*FileNaming*)


(* ::Text:: *)
(*file naming utilities for general purpose*)


BeginPackage["FileNaming`"];


(* ::Section:: *)
(*Public*)


(* ::Subsection:: *)
(*file name formatting utilities*)


Options[fNameFun]={"fMod"->"","isNoSpace"->False};
fNameFun;
valDecForm;


(* ::Subsection:: *)
(*file extension consts*)


jldType;
jld2Type;
npyType;
epsType;
jpgType;
pdfType;


(* ::Section:: *)
(*Private*)


Begin["`Private`"];


(* ::Subsection:: *)
(*file attribute list utilities*)


(* ::Input::Initialization:: *)
valLstToStr[val_] := If[ArrayQ[val], StringReplace[ToString[val], {"{" -> "[", "}" -> "]"}], ToString[val]];


(* ::Input::Initialization:: *)
fNameFun[main_, attrLst_, valLst_, fExt_,OptionsPattern[]] := Module[{fTmp = main, it,mod=OptionValue["fMod"],isNoSpace=OptionValue["isNoSpace"]},Do[fTmp = fTmp <> "_" <> attrLst[[it]] <> "_" <> valLstToStr[valLst[[it]]],{it,1,Length[attrLst]}];
   If[mod != "", fTmp = fTmp <> "_" <> mod];
   	fTmp = fTmp <> "." <> fExt;
   If[isNoSpace, fTmp = StringReplace[StringDelete[fTmp, {" ", "[", "]"}], "," -> "_"]];
   fTmp];


(* ::Input::Initialization:: *)
(*fNameFun[main_, attrLst_, valLst_, mod_, fExt_, isNoSpace_ : False] := Module[{fTmp = main, it},Do[fTmp = fTmp <> "_" <> attrLst[[it]] <> "_" <> valLstToStr[valLst[[it]]],{it,1,Length[attrLst]}];
   If[mod != "", fTmp = fTmp <> "_" <> mod];
   	fTmp = fTmp <> "." <> fExt;
   If[isNoSpace, fTmp = StringReplace[StringDelete[fTmp, {" ", "[", "]"}], "," -> "_"]];
   fTmp];*)


(* ::Input::Initialization:: *)
valDecForm[val_,numDec_]:=NumberForm[val,{\[Infinity],numDec}];


(* ::Subsection:: *)
(*file extension consts*)


jldType="jld";
jld2Type="jld2";
npyType="npy";
epsType="eps";
jpgType="jpg";
pdfType="pdf";


End[];


EndPackage[];
