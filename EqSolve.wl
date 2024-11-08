(* ::Package:: *)

(* ::Title:: *)
(*EqSolve*)


(* ::Text:: *)
(*Utility for printing strings, numbers etc*)


BeginPackage["EqSolve`"]


solQuartEq;


Begin["`Private`"]


(* ::Input::Initialization:: *)
solQuartEq[coeffLst_]:=
Module[{a,b,c,x1,x2,failLn},
failLn=Enclose[ConfirmAssert[Length[coeffLst]==3]];
If[FailureQ[failLn],Return[failLn]];
{a,b,c}=coeffLst;
If[a==0,
If[b==0,
Return[Failure["Coefficient 0",<|"MessageTemplate"->"Coefficient \!\(\*SuperscriptBox[\(x\), \(2\)]\) and x both 0","MessageParameters"-><|"{a,b}"->{a,b}|>|>]];
];
x1=-c/b;
x2=x1;
Return[{x1,x2}]
];
x1=If[b==0,Sqrt[-c/a],(-b-Sign[b]Sqrt[b^2-4a c])/(2a)];
x2=c/(a x1);
{x1,x2}
];


End[]


EndPackage[]
