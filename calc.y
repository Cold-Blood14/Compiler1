%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex();
void yyerror(const char *s);
%}
%union {
    double dval;
}
%token <dval> NUMBER
%type <dval> expr
%token SIN COS TAN LOG SQRT

%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS 

%%

calculate :
    	calculate '\n'
    |   calculate expr '\n' { printf("Result: %f\n", $2); }
    |
    ;
expr : 
	  expr '+' expr { $$ = $1 + $3; }
	| expr '-' expr { $$ = $1 - $3; }
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr {
			   if ($3 == 0){
				yyerror("Division by zero");
				$$ = 0;
			   } else {
				 $$ = $1 / $3; 
			   }
			}
    | '-' expr %prec UMINUS  { $$ = -$2; }
    | '(' expr ')' { $$ = $2; }
    | expr '^' expr { $$ = pow($1, $3); }
    | SIN '(' expr ')'	{ $$ = sin($3 * M_PI /  180); }
    | COS '(' expr ')'	{ $$ = cos($3 * M_PI /  180); }
    | TAN '(' expr ')'	{ $$ = tan($3 * M_PI /  180); }
    | LOG '(' expr ')'	{
			   if ($3 <= 0){
				yyerror("Log of non +ve");
				$$ = 0;
			   } else {
				$$ = log($3); 
			   }
			}  
    | SQRT '(' expr ')' {
			   if ($3 < 0){
				yyerror("Sqrt of -ve");
				$$ = 0;
			   } else {
				$$ = sqrt($3); 
			   }
			}  
    | NUMBER 		{ $$ = $1; }
    ;

%%

int main(){
	printf("Enter expr to calculate:\n");
	yyparse();
	return 0;
}

void yyerror(const char *s) {
	fprintf(stderr, "Error: %s\n", s);
}