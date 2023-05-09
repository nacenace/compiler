%require "3.0"

%{
    #include <cstdio>
    #include <memory>
    #include <iostream>
    #include "ast.hpp"
    #include "y.tab.h"

    using namespace spc;

    int yylex();
    int yyerror(const char *s);

    YYSTYPE program;
%}

%define api.value.type {std::shared_ptr<spc::AbstractNode>}
%define parse.error verbose
%define parse.lac full

%token PROGRAM ID CONST ARRAY VAR FUNCTION PROCEDURE END TYPE RECORD
%token _BEGIN "BEGIN"
%token INTEGER REAL CHAR STRING
%token SYS_CON SYS_FUNC SYS_PROC SYS_TYPE READ_FUNC
%token IF THEN ELSE REPEAT UNTIL WHILE DO FOR TO DOWNTO CASE OF GOTO
%token ASSIGN ":="
%token MOD AND OR XOR NOT
%token DOT "."
%token DOTDOT ".."
%token SEMI ";"
%token LP "("
%token RP ")"
%token LB "["
%token RB "]"
%token COMMA ","
%token COLON ":"
%left
    EQUAL "="
    UNEQUAL "<>"
    LE "<="
    LT "<"
    GE ">="
    GT ">"
%left 
    PLUS "+" 
    MINUS "-"
%left  
    MUL "*"
    TRUEDIV "/"
    DIV "//"
%left UMINUS
%%

export
    : program { program = $1; }
    ;

program
    : PROGRAM ID SEMI routine_head routine_body DOT
        { $$ = make_node<ProgramNode>($2, $4); $$->lift_children($5); }
    ;

routine_head
    : const_part type_part var_part routine_part
        { $$ = make_node<HeadListNode>($1, $2, $3, $4); }
    ;

const_part
    : CONST const_expr_list { $$ = $2; }
    | { $$ = make_node<ConstListNode>(); }
    ;

const_expr_list
    : const_expr_list ID EQUAL const_value SEMI
        { $$ = $1; $$->add_child(make_node<ConstDeclNode>($2, $4)); }
    | ID EQUAL const_value SEMI
        { $$ = make_node<ConstListNode>(); $$->add_child(make_node<ConstDeclNode>($1, $3)); }
    ;

const_value
    : INTEGER { $$ = $1; }
    | MINUS INTEGER %prec UMINUS { cast_node<IntegerNode>($1)->val=0-cast_node<IntegerNode>($1)->val;$$=$1; }
    | REAL    { $$ = $1; }
    | MINUS REAL %prec UMINUS { cast_node<RealNode>($1)->val=0-cast_node<RealNode>($1)->val;$$=$1;}
    | CHAR    { $$ = $1; }
    | STRING  { $$ = $1; }
    | SYS_CON { $$ = $1; }
    ;

type_part
    : TYPE type_decl_list { $$ = $2; }
    | { $$ = make_node<TypeListNode>(); }
    ;

type_decl_list
    : type_decl_list type_definition { $$ = $1; $$->add_child($2); }
    | type_definition { $$ = make_node<TypeListNode>(); $$->add_child($1); }
    ;

type_definition
    : ID EQUAL type_decl SEMI
        { $$ = make_node<TypeDefNode>($1, $3); }
    | ID COLON type_decl SEMI
        { $$ = make_node<TypeDefNode>($1, $3); }
    ;

type_decl
    : simple_type_decl { $$ = $1; }
    | ARRAY LB const_value DOTDOT const_value RB OF type_decl{$$ = make_node<ArrayTypeNode>($8,
        std::make_pair(cast_node<IntegerNode>($3)->val, cast_node<IntegerNode>($5)->val)); }
    | RECORD type_decl_list END { $$ = make_node<RecordTypeNode>($2); }
    ;

simple_type_decl
    : SYS_TYPE { $$ = $1; }
    | ID { $$ = make_node<AliasTypeNode>($1); }
    ;

var_part
    : VAR var_decl_list { $$ = $2; }
    | { $$ = make_node<VarListNode>(); }
    ;

var_decl_list
    : var_decl_list var_decl { $$ = $1; $$->lift_children($2); }
    | var_decl { $$ = $1; }
    ;

var_decl
    : name_list COLON type_decl SEMI
        { $$ = make_node<VarListNode>();
          for (auto name : $1->children()) $$->add_child(make_node<VarDeclNode>(name, $3)); }
    | name_list COLON ID SEMI
        { $$ = make_node<VarListNode>();
          for (auto name : $1->children()) $$->add_child(make_node<VarDeclNode>(name,
          make_node<AliasTypeNode>($3))); }
    ;

routine_part: routine_part function_decl { $$ = $1; $$->add_child($2); }
    | routine_part procedure_decl { $$ = $1; $$->add_child($2); }
    | { $$ = make_node<SubroutineListNode>(); }
    ;

function_decl
    : FUNCTION ID parameters COLON simple_type_decl SEMI routine_head routine_body SEMI
        { $$ = make_node<SubroutineNode>($2, $3, $5, $7); $$->lift_children($8); }
    ;

procedure_decl
    : PROCEDURE ID parameters SEMI routine_head routine_body SEMI
        { $$ = make_node<SubroutineNode>($2, $3, make_node<SimpleTypeNode>(Type::VOID), $5); $$->lift_children($6); }
    ;

parameters
    : LP para_decl_list RP { $$ = $2; }
    | LP RP { $$ = make_node<ParamListNode>(); }
    | { $$ = make_node<ParamListNode>(); }
    ;

para_decl_list
    : para_decl_list SEMI para_type_list { $$ = $1; $$->lift_children($3); }
    | para_type_list { $$ = $1; }
    ;

para_type_list
    : var_para_list COLON simple_type_decl
        { $$ = make_node<ParamListNode>();
          for (auto name : $1->children()) $$->add_child(make_node<ParamDeclNode>(name, $3)); }
    ;

// TODO: distinguish var and const
var_para_list
    : VAR name_list { $$ = $2; }
    | name_list { $$ = $1; }
    ;

name_list
    : name_list COMMA ID { $$ = $1; $$->add_child($3); }
    | ID { $$ = make_node<NameListNode>(); $$->add_child($1); }
    ;

routine_body
    : compound_stmt { $$ = $1; }
    ;

loop_body
    : compound_stmt { $$ = $1; }
    | stmt_list {$$ = make_node<CompoundStmtNode>(); $$->lift_children($1); }
    ;

for_body
    : compound_stmt { $$ = $1; }
    | stmt { $$ = make_node<CompoundStmtNode>(); $$->add_child($1); }
    ;

if_body
    : compound_stmt { $$ = $1; }
    | stmt { $$ = make_node<CompoundStmtNode>(); $$->add_child($1); }
    ;

case_body
    : case_body const_value COLON loop_body{ $$ = $1; $$->add_child(make_node<CaseNode>($2, $4)); }
    | {$$ = make_node<CaseList>(); }
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
    | assign_stmt   { $$ = $1; }
    | loop_stmt     { $$ = $1; }
    | if_stmt       { $$ = $1; }
    | case_stmt     { $$ = $1; }
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
    | READ_FUNC LP variable_list RP
        { $$ = make_node<ProcStmtNode>(make_node<SysCallNode>($1, $3)); }
    ;

assign_stmt
    : variable ASSIGN expression
        { $$ = make_node<AssignStmtNode>($1, $3); }
    ;

if_stmt
    : IF expression THEN if_body ELSE if_body { $$ = make_node<IfStmtNode>($2, $4, $6); }
    | IF expression THEN if_body { $$ = make_node<IfStmtNode>($2, $4); }
    ;

case_stmt
    : CASE expression OF case_body END { $$ = make_node<CaseStmtNode>($2, $4); }
    ;

loop_stmt
    : FOR ID ASSIGN expression TO expression DO for_body
        { $$ = make_node<LoopStmtNode>(LoopType::FOR, $4, $8, $2, $6); }
    | FOR ID ASSIGN expression DOWNTO expression DO for_body
              { $$ = make_node<LoopStmtNode>(LoopType::FOR, $4, $8, $2, $6); }
    | WHILE expression DO loop_body { $$ = make_node<LoopStmtNode>(LoopType::WHILE, $2, $4); }
    | REPEAT loop_body UNTIL expression {$$ = make_node<LoopStmtNode>(LoopType::REPEAT, $4, $2); }
    ;

variable_list
    : variable_list COMMA variable
        { $$ = $1; $$->add_child($3); }
    | variable
        { $$ = make_node<ArgListNode>(); $$->add_child($1); }
    ;

variable
    : ID
        { $$ = $1; }
    | ID LB expression RB
        { $$ = make_node<ArrayRefNode>(cast_node<IdentifierNode>($1)->name.c_str(), $3); }
    | ID DOT ID
        { $$ = make_node<StructRefNode>(cast_node<IdentifierNode>($1)->name.c_str(),
        cast_node<IdentifierNode>($3)->name); }

expression
    : expression GE expr { $$ = make_node<BinopExprNode>(BinaryOperator::GE, $1, $3); }
    | expression GT expr { $$ = make_node<BinopExprNode>(BinaryOperator::GT, $1, $3); }
    | expression LE expr { $$ = make_node<BinopExprNode>(BinaryOperator::LE, $1, $3); }
    | expression LT expr { $$ = make_node<BinopExprNode>(BinaryOperator::LT, $1, $3); }
    | expression EQUAL expr { $$ = make_node<BinopExprNode>(BinaryOperator::EQ, $1, $3); }
    | expression UNEQUAL expr { $$ = make_node<BinopExprNode>(BinaryOperator::NE, $1, $3); }
    | expr { $$ = $1; }
    ;

expr
    : expr PLUS term { $$ = make_node<BinopExprNode>(BinaryOperator::ADD, $1, $3); }
    | expr MINUS term { $$ = make_node<BinopExprNode>(BinaryOperator::SUB, $1, $3); }
    | expr OR term { $$ = make_node<BinopExprNode>(BinaryOperator::OR, $1, $3); }
    | expr XOR term { $$ = make_node<BinopExprNode>(BinaryOperator::XOR, $1, $3); }
    | term { $$ = $1; }
    ;

term
    : term MUL factor { $$ = make_node<BinopExprNode>(BinaryOperator::MUL, $1, $3); }
    | term TRUEDIV factor { $$ = make_node<BinopExprNode>(BinaryOperator::TRUEDIV, $1, $3); }
    | term DIV factor { $$ = make_node<BinopExprNode>(BinaryOperator::DIV, $1, $3); }
    | term MOD factor { $$ = make_node<BinopExprNode>(BinaryOperator::MOD, $1, $3); }
    | term AND factor { $$ = make_node<BinopExprNode>(BinaryOperator::AND, $1, $3); }
    | factor { $$ = $1; }
    ;

factor
    : variable { $$ = $1; }
    | ID LP RP
        { $$ = make_node<FuncExprNode>(make_node<RoutineCallNode>($1)); }
    | ID LP args_list RP
        { $$ = make_node<FuncExprNode>(make_node<RoutineCallNode>($1, $3)); }
    | SYS_FUNC LP args_list RP
        { $$ = make_node<FuncExprNode>(make_node<SysCallNode>($1, $3)); }
    | const_value { $$ = $1; }
    | LP expression RP { $$ = $2; }
    | NOT factor
        { $$ = make_node<BinopExprNode>(BinaryOperator::XOR, make_node<BoolenNode>(true), $2); }
    | MINUS factor
        { $$ = make_node<BinopExprNode>(BinaryOperator::SUB, make_node<IntegerNode>(0), $2); }
    ;

args_list
    : args_list COMMA expression { $$ = $1; $$->add_child($3); }
    | expression { $$ = make_node<ArgListNode>(); $$->add_child($1); }
    ;

%%

extern int line_no;

inline int yyerror(const char *s) {
    fprintf(stderr, "Bison error at line %d: %s\n", line_no, s);
    exit(-1);
}
