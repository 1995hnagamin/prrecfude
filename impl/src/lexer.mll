{
open Parser
exception Error of string
}

let space = [' ' '\009' '\012' '\r']
let digit = ['0'-'9']
let lowalpha = ['a'-'z']
let capalpha = ['A'-'Z']
let alpha = lowalpha | capalpha
let alnum = digit | alpha

rule main = parse
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '[' { LBRAKET }
  | ']' { RBRAKET }
  | '.' { DOT }
  | ".." { DOTDOT }
  | ',' { COMMA }
  | ";" { SEMI }
  | ">>" { GTGT }
  | "=" { EQ }
  | "Def" { DEF }
  | "K" { K }
  | "P" { P }
  | "S" { S }
  | lowalpha alnum* { ID (Lexing.lexeme lexbuf) }
  | digit+ { INTV (int_of_string (Lexing.lexeme lexbuf)) }
  | space+ { main lexbuf }
  | eof { EOF }
  | _ { raise (Error (Printf.sprintf "Error at %d\n" (Lexing.lexeme_start lexbuf)))}
