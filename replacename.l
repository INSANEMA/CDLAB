%{
#include<stdio.h>
#include<string.h>
char word[]="hari";
char r[]="hk";
%}
%%
[a-zA-Z]+ {if(strcmp(yytext,word)==0) 
		printf("%s ",r);
	else printf("%s",yytext);}
. ;

%%
int main()
{
	printf("enter the nput\n");
	yylex();
}
