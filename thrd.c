#include <stdlib.h>
#include <string.h>

#define MIN(a, b) (a)>(b)?(b):(a)

int _stricmp(const char *s1, const char *s2)
{
    int i,size;

    if(!s1 || !s2)
        return 1;

    size = MIN(strlen(s1), strlen(s2));

    for(i=0; i<size; i++)
    {
        char c1=s1[i], c2=s2[i];

        if(c1==c2)
            continue;

        if(c1>='A' && c1<='Z')
        {
            if(c1+32==c2)
                continue;
            return c1-c2;

        }else if(c1>='a' && c1<='z')
        {
            if(c1-32==c2)
                continue;
            return c1-c2;
        
        }else
            return c1-c2;
    }

    return 0;
}


void _upper(char *s1)
{
    int i;

    if(!s1)
        return;

    for(i=0; i<strlen(s1); i++)
    {
        char ch = s1[i];

        if(ch >= 'a' && ch <= 'z')
            ch -= 32;

        s1[i] = ch;
    }
}


void _lower(char *s1)
{
    int i;

    if(!s1)
        return;

    for(i=0; i<strlen(s1); i++)
    {
        char ch = s1[i];

        if(ch >= 'A' && ch <= 'Z')
            ch += 32;

        s1[i] = ch;
    }
}


