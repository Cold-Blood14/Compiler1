%{
#include <stdio.h>
%}
%%
"if"|"else" {printf("Keyword: %s\n",yytext);}
[0-9]+ {printf("Number: %s\n",yytext);}
[a-zA-Z_][0-9a-zA-Z_]* {printf("Identifier: %s\n",yytext);} 
[+\-*/=] {printf("Operator: %s\n",yytext);} 
[ \t\n] {}
. {printf("Unknown");}
%%
int yywrap(void){}
int main(){
yylex();
return 0;
}
