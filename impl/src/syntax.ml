type expr =
  | Proj of int * int
  | Const of int
  | Succ
  | Comp of expr * (expr list)
  | Prec of expr * expr
  | Var of string

type program =
  | DefExpr of string * expr
