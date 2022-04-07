%{
#include <stdio.h>
#include "y.tab.h"
#include "thrd.h"
   /*
   enum{
        DIG=258,
        ADD,
        SUB,
        MUL,
        DIV,
        MOD,
   };
   */

   typedef struct{
        const char *act;
        int         val;
   }str_opt_t;

    str_opt_t  stringopts[] = {
        {"toupper", UPPER},
        {"tolower", LOWER},
    };

%}

%%
[0-9]+             {yylval.i4=atoi(yytext); return DIG;}    
"<<"               {return LSH;}
">>"               {return RSH;}
"("                {return LP;}
")"                {return RP;}
"^"                {return POWER;}
[+]                {return ADD;}
[-]                {return SUB;}
[*]                {return MUL;}
[/]                {return DIV;}
[%]                {return MOD;}
[\n]               {return ENTER;}
[A-Za-z,\-.'"]+    {
                       int i;

                       yylval.str=strdup(yytext);
                       for(i=0; i<sizeof(stringopts)/sizeof(str_opt_t); i++)
                       {
                           if(!_stricmp(yytext, stringopts[i].act))
                                return stringopts[i].val;

                           if(!_stricmp(yytext, "exit"))
                                exit(0);
                       }

                       return SOURCE;
                   }
%%


int yywrap(void)
{
    printf("**\n");
    return 1;
}
