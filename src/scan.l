%{
    #include <cstdio>
    #include <cassert>
    #include <limits>
    #include "ast.hpp"
    #include "y.tab.h"

    using namespace spc;

    int line_no = 1;
    void commenteof();
%}

A [aA]
B [bB]
C [cC]
D [dD]
E [eE]
F [fF]
G [gG]
H [hH]
I [iI]
J [jJ]
K [kK]
L [lL]
M [mM]
N [nN]
O [oO]
P [pP]
Q [qQ]
R [rR]
S [sS]
T [tT]
U [uU]
V [vV]
W [wW]
X [xX]
Y [yY]
Z [zZ]
NQUOTE [^']

%option noyywrap
%%

{B}{E}{G}{I}{N}             return _BEGIN;
{E}{N}{D}                   return END;
{P}{R}{O}{G}{R}{A}{M}       return PROGRAM;


{S}{T}{R}{I}{N}{G} {
    yylval = make_node<StringTypeNode>();
    return SYS_TYPE;
}

{W}{R}{I}{T}{E}{L}{N} { yylval = make_node<SysRoutineNode>(SysRoutine::WRITELN); return SYS_PROC; }
{W}{R}{I}{T}{E} { yylval = make_node<SysRoutineNode>(SysRoutine::WRITE); return SYS_PROC; }
[a-zA-Z_]([a-zA-Z0-9_])* {
    yylval = make_node<IdentifierNode>(yytext);
    return ID;
}

'({NQUOTE}|\')+'    { yylval = make_node<StringNode>(yytext); return STRING; }

"."                 return DOT;
"("                 return LP;
")"                 return RP;
";"                 return SEMI;

[ \t\f]    ;

\n   { line_no++; }

.    { fprintf (stderr, "'%c' (0%o): illegal character at line %d\n", yytext[0], yytext[0], line_no); }

%%

inline void commenteof() {
    fprintf(stderr, "unexpected EOF inside comment at line %d\n", line_no);
    exit(1);
}
