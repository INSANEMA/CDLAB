//input: 5, S=AbCd,A=a,A=Cf,C=gE,E=h
#include<stdio.h>
#include<string.h>
#include<ctype.h>
char a[10][10],f[10],c;
int n,m=0,con;
void first(char c);
void follow(char c);
int main()
{
	printf("enter the no of productions\n");
	scanf("%d",&n);
	printf("enter the productions\n");
	for(int i=0;i<n;i++)
	{
		scanf("%s",a[i]);
	}
	do{
		printf("enter the element whose first and follow is to be found\n");
		scanf(" %c",&c);
		m=0;
		first(c);
		printf("\nfirst(%c) :",c);
		for(int i=0;i<m;i++)
		{
			printf("%c ",f[i]);
		}
		printf("\n");
		m=0;
		follow(c);
		printf("\nfollow(%c) :",c);
		for(int i=0;i<m;i++)
		{
			printf("%c ",f[i]);
		}
		printf("\n");
		printf("do you want to continue\n");
		scanf("%d",&con);
	}while(con);
}
void first(char c)
{
	
		if(islower(c))
			f[m++]=c;
		else
		{
			for(int i=0;i<n;i++)
			{
				if(a[i][0]==c)
				{
					if(islower(a[i][2]))
					{
						f[m++]=a[i][2];
					}
					else if (a[i][2]=='$')
					{
						follow(a[i][2]);
					}
					else
						first(a[i][2]);
				}
			}
		}
}
void follow(char c)
{
	if(a[0][0]==c)
		f[m++]='$';
	else
	{
		for(int i=0;i<n;i++)
		{
			for(int j=2;j<n;j++)
			{
				if(a[i][j]==c)
				{
					if(a[i][j+1]!='\0' )
						first(a[i][j+1]);
				
					else if(a[i][j+1]=='\0' &&a[i][0]!='c')
						follow(a[i][0]);
				}
			}
		}
	}
