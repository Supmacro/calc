
calc : lex.yy.o y.tab.o thrd.o main.o
	gcc -o $@ $^
%.o : %.c
	gcc -g -c $<

.PHONY: clean bison
clean : 
	@rm -f calc *.o lex.yy.c y.tab.c y.tab.h *.output
bison : 
	flex calc.l
	bison -vdty calc.y

