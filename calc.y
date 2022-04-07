%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "thrd.h"

#define IPROMPT "\r= %d\n"
#define SPROMPT "\r= %s\n"
void yyerror(const char *msg);
unsigned power(int, int);
%}

%union{
    char *str;
    int   i4;
}

%token <i4>  DIG ADD SUB MUL DIV 
             MOD LSH RSH ENTER LP RP POWER
%token <str> UPPER LOWER SOURCE 

%left LSH RSH
%left ADD SUB
%left MUL DIV MOD
%left POWER 
%left LP RP

%type <i4>  i4_exp
%type <str> sp_exp expr

%%
expr : expr i4_exp ENTER {
           printf(IPROMPT, $2);
           printf("> ");
     }
     | expr sp_exp ENTER {
           printf(SPROMPT, $2);
           printf("> ");
     }
     | {}
     ;

i4_exp : i4_exp ADD i4_exp {$$=$1+$3;}
       | i4_exp SUB i4_exp {$$=$1-$3;}
       | i4_exp MUL i4_exp {$$=$1*$3;}
       | i4_exp DIV i4_exp {$$=$1/$3;}
       | i4_exp MOD i4_exp {$$=$1%$3;}
       | i4_exp LSH i4_exp {$$=$1<<$3;}
       | i4_exp RSH i4_exp {$$=$1>>$3;}
       | i4_exp POWER i4_exp {$$=power($1,$3);}
       | DIG {$$=$1;}
       | LP i4_exp RP {$$=$2;}
       ;

sp_exp : sp_exp SOURCE {$$=$1;}
       | UPPER LP sp_exp RP {$$=$3;_upper($$);}
       | LOWER LP sp_exp RP {$$=$3;_lower($$);}
       | SOURCE {$$=$1;}
       ;
%%


unsigned power(int base, int index)
{
    int i = 0;
    unsigned res = index>0?1:index==0?1:0;

    if(index <= 0)
        return res;

    for(;i<index;i++)
    {
        res *= base;
    }
    return res;
}


void yyerror(const char *msg)
{

    if(msg){
        printf("\r> %s\n",msg);
        printf("\r> ");
    }
    return;
}
