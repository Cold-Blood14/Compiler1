open cmd then cd to file directory 
flex filename.l
gcc lex.yy.c
a.exe
for parser
bison -d filename.y
flex same_filename.y
gcc lex.yy.c add.tab.h
a.exe
