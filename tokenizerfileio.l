%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
"if"|"else" {printf("Keyword: %s\n",yytext);}
"printf"|"scanf" {printf("Keyword: %s\n",yytext);}
["][a-zA-Z0-9@#$%^&*(){},;!_ ]*["] {printf("String : %s\n",yytext);}
[0-9]+ {printf("Number: %s\n",yytext);}
[a-zA-Z_][0-9a-zA-Z_]* {printf("Identifier: %s\n",yytext);} 
[+\-*/=] {printf("Operator: %s\n",yytext);} 
[ \t\n] {}
[\(\)] {printf("Parenthesis: %s\n",yytext);}
[\{\}] {printf("Curly Braces: %s\n",yytext);}
[\,\;] {printf("Comma: %s\n",yytext);}
. {printf("Unknown");}
%%
int yywrap(void){}
int main(int argc, char **argv){
if (argc>1){
	FILE *file = fopen(argv[1], "r");
if(!file){
	perror("fopen");
	return EXIT_FAILURE;
	}
	yyin=file;
}
yylex();
return 0;
}
