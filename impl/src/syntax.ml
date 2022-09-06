type expr =
  | Proj of int * int
  | Const of int
  | Succ
  | Comp of expr * (expr list)
  | Prec of expr * expr

type program =
  | DefExpr of string * expr
