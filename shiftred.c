//grammer E->E+E/E*E/(E)/id
//input id+id*id+id
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char inp[10],stk[20],action[20],act[20];
int c,i=0,j=0,k=0;
void check();
int main()
{
printf("enter the input string with $ at the end\n");
scanf("%s",inp);
c=strlen(inp);
strcpy(action,"SHIFT->");
printf("STACK\tINPUT\tACTION\n");
printf("-----------------------\n");
for(i=0,j=0,k=0;j<c;i++,j++,k++)
{
	if(inp[j]=='i' && inp[j+1]=='d')
	{
		stk[i]=inp[j];
		stk[i+1]=inp[j+1];
		stk[i+2]='\0';
		inp[j]=' ';
		inp[j+1]=' ';
		printf("%s \t\t%s\t\t%sID\n",stk,inp,action);
		check();
	}
	else
	{
		stk[i]=inp[j];
		stk[i+1]='\0';
		inp[j]=' ';
		printf("%s \t\t%s\t\t%sSYMBOL\n",stk,inp,action);
		check();
	}
}
if(strcmp(stk,"E$")==0)
	printf("parsing successfull\n");
}
void check()

{
	strcpy(act,"Reduce TO E");
	for(int z=0;z<c;z++)
	{
		if(stk[z]=='i' && stk[z+1]=='d')
		{
			stk[z]='E';
			stk[z+1]='\0';
			printf("%s\t\t%s\t\t%s\n",stk,inp,act);
			j++;
		}
	}
	for(int z=0;z<c;z++)
	{
		if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='E')
		{
			stk[z]='E';
			stk[z+1]='\0';
			stk[z+2]='\0';
			printf("%s\t\t%s\t\t%s\n",stk,inp,act);
			i=i-2;
		}
	}
	for(int z=0;z<c;z++)
	{
		if(stk[z]=='E' &&stk[z+1]=='*' && stk[z+2]=='E')
		{
			stk[z]='E';
			stk[z+1]='\0';
			stk[z+2]='\0';
			printf("%s\t\t%s\t\t%s\n",stk,inp,act);
			i=i-2;
		}
	}
	for(int z=0;z<c;z++)
	{
		if(stk[z]=='(' &&stk[z+1]=='E' && stk[z+2]==')')
		{
			stk[z]='E';
			stk[z+1]='\0';
			stk[z+2]='\0';
			printf("%s\t\t%s\t\t%s\n",stk,inp,act);
			i=i-2;
		}
	}
}
