open Printf

type expr =
  | Proj of int * int
  | Const of int
  | Succ
  | Comp of expr * (expr list)
  | Prec of expr * expr
  | Var of string

type program =
  | DefExpr of string * expr

let rec string_of_expr = function
  | Proj(i, n) -> sprintf "(P %d %d)" i n
  | Const(n) -> sprintf "(K %d)" n
  | Succ -> "S"
  | Comp(g, fs) ->
    let fs = List.map string_of_expr fs in
    sprintf "(comp %s %s)"
      (string_of_expr g)
      (String.concat " " fs)
  | Prec(g, f) ->
    sprintf "(prec %s %s)" 
      (string_of_expr g)
      (string_of_expr f)
  | Var(id) -> sprintf "(var %s)" id

let stringify = function
| DefExpr(id, exp) ->
  sprintf "(defexpr %s %s)" id (string_of_expr exp)
