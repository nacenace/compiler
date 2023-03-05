%require "3.0"

%{
    #include <cstdio>
    #include <memory>
    #include <iostream>
    #include "ast.hpp"
    #include "y.tab.h"

    using namespace exp;

    int yylex();
    int yyerror(const char *s);

    YYSTYPE program;
%}

%define api.value.type {std::shared_ptr<exp::AbstractNode>}
%define parse.error verbose
%define parse.lac full

%token PROGRAM ID END
%token _BEGIN "BEGIN"
%token STRING
%token SYS_CON SYS_FUNC SYS_PROC SYS_TYPE READ_FUNC
%token DOT "."
%token SEMI ";"
%token LP "("
%token RP ")"
%token COMMA ","

%%

export
    : program { program = $1; }
    ;

program
    : PROGRAM ID SEMI routine_body DOT
        { $$ = make_node<ProgramNode>($2); $$->lift_children($4); }
    ;

routine_body
    : compound_stmt { $$ = $1; }
    ;

compound_stmt
    : _BEGIN stmt_list END
        { $$ = make_node<CompoundStmtNode>(); $$->lift_children($2); }
    ;

stmt_list
    : stmt_list stmt SEMI { $$ = $1; $$->add_child($2); }
    | { $$ = make_node<StmtList>(); }
    ;

stmt
    : proc_stmt     { $$ = $1; }
    ;

proc_stmt
    : ID LP RP
        { $$ = make_node<ProcStmtNode>(make_node<RoutineCallNode>($1)); }
    | ID LP args_list RP
        { $$ = make_node<ProcStmtNode>(make_node<RoutineCallNode>($1, $3)); }
    | SYS_PROC LP RP
        { $$ = make_node<ProcStmtNode>(make_node<SysCallNode>($1)); }
    | SYS_PROC LP args_list RP
        { $$ = make_node<ProcStmtNode>(make_node<SysCallNode>($1, $3)); }
    ;

args_list
    : args_list COMMA expression { $$ = $1; $$->add_child($3); }
    | expression { $$ = make_node<ArgListNode>(); $$->add_child($1); }
    ;

expression
    : expr { $$ = $1; }
    ;

expr
    : term { $$ = $1; }
    ;

term
    : factor { $$ = $1; }
    ;

factor
    : ID { $$ = $1; }
    | ID LP args_list RP
        { $$ = make_node<FuncExprNode>(make_node<RoutineCallNode>($1, $3)); }
    | const_value { $$ = $1; }
    ;

const_value
    : STRING  { $$ = $1; }
    ;

%%

extern int line_no;

inline int yyerror(const char *s) {
    fprintf(stderr, "Bison error at line %d: %s\n", line_no, s);
    exit(-1);
}
