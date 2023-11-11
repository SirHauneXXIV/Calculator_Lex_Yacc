lex calc.l
yacc calc.y -d
gcc -o calc lex.yy.c y.tab.c -lm
./calc
