%{
#include<stdio.h>

FILE *yyin;
FILE *yyout;
%}

%%

\<[^>]*\>     { fprintf(yyout, "%s\n", yytext); }

.             ;

%%

int main()
{
    yyin = fopen("ht.txt", "r");
    yyout = fopen("ot.txt", "w");

    if (yyin == NULL || yyout == NULL)
    {
        printf("File Error\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("HTML tags extracted successfully\n");
    printf("Output stored in ot.txt\n");

    return 0;
}

int yywrap()
{
    return 1;
}
