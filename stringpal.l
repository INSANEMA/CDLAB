%{
#include<stdio.h>
int i,j;
int flag=1;
%}
%%
[a-zA-Z]+ {for(i=0,j=yyleng-1;i<=j;i++,j--)
		{
			if(yytext[i]==yytext[j])
			{	flag=1;
			}
			else
			{	flag=0;
			break;}
		}
	}
\n return 0;
%%
int main()
{
	printf("enter the world\n");
	yylex();
	if(flag)
		printf("palindrome\n");
	else
		printf("not palindrome\n");
}
