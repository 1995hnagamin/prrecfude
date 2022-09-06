%{
open Syntax
%}

%token LPAREN RPAREN LBRAKET RBRAKET
%token DOT DOTDOT COMMA SEMI GTGT EQ
%token DEF K P S
%token <int> INTV
%token <string> ID
%token EOF

%start toplevel
%type <Syntax.program> toplevel
%%

toplevel :
| DEF id=ID EQ e=Expr SEMI { DefExpr(id, e) }

Expr :
| e=Predef { e }
| e=CompExpr { e }
| e=PrimRecExpr { e }
| LPAREN e=Expr RPAREN { e }

Predef :
| P LBRAKET i=INTV COMMA n=INTV RBRAKET { Proj(i, n) }
| K LBRAKET n=INTV RBRAKET { Const(n) }
| S { Succ }

CompExpr :
| g=Expr DOT f=Expr { Comp(g, [f]) }
| g=Expr DOTDOT LPAREN fs=separated_nonempty_list(COMMA, Expr) RPAREN { Comp(g, fs) }

PrimRecExpr :
| g=Expr GTGT f=Expr { Prec(g, f) }
