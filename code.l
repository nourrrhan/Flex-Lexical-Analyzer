%{
int count =1;
%}
delllim [ \t\n]
n .*\n
ws {delllim}+
digit [0-9]
letter [A-Za-z_]
id {letter}({letter}|{digit})*
number [+-]?{digit}+(\.{digit}+)?(E[+-]?{digit}+)?
Keyword if|else|for|while|switch
%%
{n}		{count++;}
{Keyword}	{printf("<%s,KW>",yytext);}
{id}		{printf("<%s,ID>",yytext);}
{number}	{printf("<%s,Number>",yytext);}
.
%%
int yywrap()
{
return 1;
}

int main()
{	
	printf("please enter your code");
	yylex();
	printf("%d",count);
	return 0;
}