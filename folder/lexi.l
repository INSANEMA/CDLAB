%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
[a-zA-Z]*"hari"[a-zA-Z]* ;
[a-zA-Z]* {printf(" string is :%s",yytext);}
[\n] {return 0;}

%%
int main()
{
	printf("enter the input\n");
	yylex();
}
int yywrap()
{
	return 1;
}
