### Instructions for Compiling and Running the Lexer and Parser

Open Command Prompt and navigate to the file directory:

cd path\to\your\file\directory

#### For Lexer

Run the following commands:

flex filename.l

gcc lex.yy.c

a.exe



#### For Parser

Run the following commands:

bison -d filename.y

flex same_filename.l

gcc lex.yy.c add.tab.h

a.exe
