%{
#include<stdio.h>
#include<string.h>
int valid=1;
%}
%token OPEN CLOSED ID;
%%

s: OPEN ID CLOSED e OPEN ID CLOSED;
e: ID|s| ;
%%
int main()
{
	printf("enter an html tag\n");
	yyparse();
	if(valid)
		printf("valid html tag\n");
}
void yyerror()
{
		printf("invlaid tag\n");
		valid=0;
}
