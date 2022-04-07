#include <stdio.h>
#include "y.tab.h"


void title()
{
    printf("\n");
    printf("---------------------------------------\n");
    printf("     :::::  ::::::  ::  :::::\n");
    printf("    ::     ::   ::  :: ::\n");
    printf("    ::     ::   ::  :: ::\n");
    printf("     :::::  ::::::: ::  :::::\n");
    printf("---------------------------------------\n");
    printf("> ");
}


int main(int argc, char* argv[])
{
    int    ret;

    title();

    do{
        ret = yyparse();
        
    }while(1);
}
