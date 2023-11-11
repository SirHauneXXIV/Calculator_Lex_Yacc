%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

%option noyywrap

DIGIT ([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?)

%%

{DIGIT}       {  yylval.num = atof(yytext); return NUMBER; }
[-()+*/; ^]   { return *yytext; }
"="           { return EVALUAR;}
[[:blank]]    ;
.             yyerror("Caracter invalido");

%%
