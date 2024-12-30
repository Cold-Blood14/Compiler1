%{
#include "calc.tab.h"
%}

%%
[0-9]+(\.[0-9]+)? { yylval.dval = atof(yytext);
		    printf("Token: NUMBER, Value: %f\n", yylval.dval);
		    return NUMBER; }
"sin"		  {return SIN; }
"cos"		  {return COS; }
"tan"		  {return TAN; }
"log"		  {return LOG; }
"sqrt"		  {return SQRT; }
[+\-*/\^()]	  {return yytext[0]; }
[ \t]		  {}
\n		  { return '\n'; }
.		  { printf("Unknown character: %s\n", yytext); }
%%
int yywrap(){ 
	return 1;
}