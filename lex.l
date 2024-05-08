%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mem.h"
#include "parser.tab.h"
%}

%option noyywrap



%%
[ \t]
[0-9]+(\.[0-9]+)?          					{ yylval.num = atof(yytext); return NUMBER; }
"+"                         					{ return ADD; }
"-"                         					{ return SUB; }
"*"                         					{ return MUL; }
"/"                         					{ return DIV; }
"="																		{ return EQUALS; }
"("																		{ return L_BRACKET; }
")"																		{ return R_BRACKET; }
("var")|("VAR")												{ return VAR_KEYWORD; }
[a-zA-Z0-9]+  												{ yylval.index = add_variable(yytext); return VARIABLE; }
[\n]                        					{ return EOL; }
. 																		{ yyerror("Undefined symbol"); exit(1); } 
%%
