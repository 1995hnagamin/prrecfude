let () =
  let decl = Parser.toplevel Lexer.main (Lexing.from_channel stdin) in
  print_string (Syntax.stringify decl);
  print_newline ()
