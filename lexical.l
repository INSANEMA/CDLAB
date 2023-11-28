%{
#include<stdio.h>
int dig=0,id=0,s=0,ss=0,c=0,op=0;
%}
%%
int|float|char|if|else|for {printf("kwd\n");}
[0-9]+ {dig++;printf("%s :num\n",yytext);}
[a-zA-Z][a-zA-Z0-9]* {id++;
			printf("%s :id\n",yytext);}
[,;()] {s++;
		printf("%s:seperators\n",yytext);}
[?|!] {ss++;
		printf("special symbols\n");}
"+"|"-"|"/"|"*"|"%"|"&&"|"<"|"=" {op++;
				printf("%s:operators\n",yytext);}
"//"[a-zA-Z0-9]* {c++;
			printf("%s: comment\n",yytext);}
%%
int main()
{
	yylex();
	printf("no of \n dig:%d\t id:%d\t seprators:%d\t special symbols:%d\t comments:%d\t operators:%d\t",dig,id,s,ss,c,op);
}
int yywrap()
{
	return 1;
}

