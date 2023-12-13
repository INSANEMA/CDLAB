%{
    #include<stdio.h>
    int k=0,i=0,p=0,c=0,a=0,s=0,m=0,d=0,e=0,sc=0;
%}

%%


bool |
float |
int |
double {k++; printf("%s is Keyword ",yytext);}
[a-zA-Z][a-zA-Z0-9]* {i++; printf("%s is identifier ",yytext);}
[.,'";]+ {p++; printf("%s is punctuators ",yytext);}
[-,+]?[0-9] {c++; printf("%s is Constants ",yytext);}
\+ {a++; printf("%s is op-plus ",yytext);}
\- {s++; printf("%s is op-minus ",yytext);}
\* {m++; printf("%s is op-mul ",yytext);}
\/ {d++; printf("%s is op-div ",yytext);}
= {e++; printf("%s is op-equal ",yytext);}
[!@#$%^&*()]+ {sc++; printf("%s is special characters ",yytext);}

%%

int main(){
    FILE *fp;
    fp=fopen("input.txt","r");
    yyin=fp;
    yylex();
    printf("\nkeywords %d\n",k);
    printf("identifiers %d\n",i);
    printf("punctuatorss %d\n",p);
    printf("constants %d\n",c);
    printf("add %d\n",a);
    printf("sub %d\n",s);
    printf("mul %d\n",m);
    printf("div %d\n",d);
    printf("equal %d\n",e);
    printf("special %d\n",sc);
}

int yywrap(){
    return 1;
}
