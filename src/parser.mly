%{
  open Lang
%}

%token <int> INT
%token <bool> BOOL
%token <string> NAME

%token LPAREN     (* ( *)
%token RPAREN     (* ) *)
%token PLUS       (* + *)
%token MINUS      (* - *)
%token TIMES      (* * *)
%token DIVIDE     (* / *)
%token LEQ        (* <= *)
%token IF         (* if *)
%token THEN       (* then *)
%token ELSE       (* else *)
%token LET        (* let *)
%token EQUALS     (* = *)
%token IN         (* in *)
%token FUN        (* fun *)
%token ARROW      (* -> *)

%token EOF

%start <Lang.exp> prog

%%

prog:
  | e=exp EOF  { e }

exp:
  | e1=base_exp op=bin_op e2=exp        { EBinOp (op, e1, e2) }
  | IF e1=exp THEN e2=exp ELSE e3=exp   { EIf (e1, e2, e3) }
  | LET n=NAME EQUALS e1=exp IN e2=exp  { ELet (EVar n, e1, e2) }
  | FUN n=NAME ARROW e=exp              { EVal (VFun (EVar n, e)) }
  | e1=exp e2=exp                       { EFunCall (e1, e2) }
  | e=base_exp                          { e }

bin_op:
  | PLUS   { OAdd }
  | MINUS  { OSubtract }
  | TIMES  { OMultiply }
  | DIVIDE { ODivide }
  | LEQ    { OLessThanEq }

base_exp:
  | i=INT               { EVal (VLit (LInt i)) }
  | b=BOOL              { EVal (VLit (LBool b)) }
  | n=NAME              { EVar n }
  | LPAREN e=exp RPAREN { e }
