%{
#include<stdio.h>
#include<stdlib.h>
int valid=1;
%}
%token letter
%token digit
%%
start:letter s
s:letter s|digit s| ;
%%
int main()
{
	printf("enter the input var name\n");
	yyparse();
	if(valid)
		printf("valid name\n");
	
}
void yyerror()
{
	printf("not a vlid name\n");
	valid=0;
}
