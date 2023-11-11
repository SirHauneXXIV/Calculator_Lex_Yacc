%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *s);
%}
%union {
    double num;
}
%type <num>Expr
%token <num>NUMBER
%token EVALUAR
%start INICIO
%left '+' '-'
%left '*' '/'
%right '^'

%%
INICIO
	: Expr EVALUAR
	{
	    printf("\n%g\n", $1);
	    return 0;
	}
Expr
	: '(' Expr ')'
	{
	    $$ = $2;
	}
	| Expr '+' Expr
	{
	    $$ = $1 + $3;
	}
	| Expr '-' Expr
	{
	    $$ = $1 - $3;
	}
	| Expr '*' Expr
	{
	    $$ = $1 * $3;
	}
	| Expr '/' Expr
	{
	    $$ = $1 / $3;
	}
	| Expr '^' Expr
	{
	    $$ = $1;
	    while($3>1) {
	        $$ = $1 * $$;
	        $3 = $3-1;
	    }
	}
	| NUMBER
	{
	    $$ = $1;
	}
%%
int main() {
    return(yyparse());
}

void yyerror(char *s) {
    printf("\n%s\n", s);
}
int yywrap() {
    return 1;
}
