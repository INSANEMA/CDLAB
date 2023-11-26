%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM
%left '-' '+'
%left '*' '/' '%'
%left '('')'
%%
exp:s{printf("the value is %d\n",$$);}
s:s'+'s{$$=$1+$3;} | s'-'s{$$=$1-$3;}|s'*'s{$$=$1*$3;}|s'/'s{$$=$1/$3;}|s'%'s{$$=$1%$3;}|
	'('s')'{$$=$2;}|NUM{$$=$1;}| ;
%%
int main()
{
	printf("enter the expression \n");
	yyparse();
}
void yyerror()
{
	printf("not a valid exp\n");
}
