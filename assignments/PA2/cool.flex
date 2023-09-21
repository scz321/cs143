/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>
#include <stdio.h>
using namespace std;

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;
int cmt_depth=0;
/*
 *  Add Your own definitions here
 */

%}

/*
 * Define names for regular expressions here.
 */

DARROW          =>
%x     COMMENT STRING CMT_2  
ASSIGN          <-
LE              <=
DIGIT           [0-9]

%option noyywrap


%%

 /*
  *  Nested comments
  */
<INITIAL,COMMENT,CMT_2>"(*"       {cmt_depth++;BEGIN(COMMENT);}
    
    
    
    
<COMMENT>"*)"                           { 
                                            cmt_depth--;
                                            if(cmt_depth==0){
                                                BEGIN(INITIAL); 
                                            }
                                            
                                        }
<COMMENT>.     {}
<COMMENT>\n    {curr_lineno++;}      /*易错点，忽略对\n的特殊处理----它会影响一些全局变量*/
<COMMENT><<EOF>>        { BEGIN(INITIAL); cool_yylval.error_msg = "EOF in comment"; return ERROR; }
<INITIAL>"--"                {BEGIN(CMT_2);}      /*这里其实还有待优化------没有考虑comment嵌套的问题*/
<CMT_2>[^\n]*                       {/* do nothing */ }
<CMT_2>\n                    {
                                curr_lineno++;
                                BEGIN(INITIAL);

                                     }
"*)"                                                        { 
                                                                    cool_yylval.error_msg = "不匹配的 *)";
                                                                    return ERROR;
                                                                }





 /*
  *  The multiple-character operators，它们理所应当比single-character operator先执行
  */
"=>"                                                            {   
                                                                    return DARROW;
                                                                }

"."                                                             { 
                                                                    return '.'; 
                                                                }

"@"                                                             { 
                                                                    return '@'; 
                                                                }

"~"                                                             {   
                                                                    return '~';
                                                                }

"*"                                                             {   
                                                                    return '*';
                                                                }

"/"                                                             {   
                                                                    return '/';
                                                                }

"+"                                                             { 
                                                                    return '+';
                                                                }

"-"                                                             {   
                                                                    return '-';
                                                                }

"<="                                                            {   
                                                                    return LE;
                                                                }

"<"                                                             { 
                                                                    return '<';
                                                                }

"="                                                             { 
                                                                    return '=';
                                                                }

"<-"                                                            { 
                                                                    return ASSIGN;
                                                                } 

":"                                                             { 
                                                                    return ':'; 
                                                                }


"{"                                                             { 
                                                                    return '{'; 
                                                                }

"}"                                                             { 
                                                                    return '}'; 
                                                                }

";"                                                             { 
                                                                    return ';';
                                                                }

"("                                                             { 
                                                                    return '(';
                                                                }

")"                                                             { 
                                                                    return ')'; 
                                                                }

","                                                             { 
                                                                    return ','; 
                                                                }






 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */

(?i:CLASS)                                                      {   
                                                                    return CLASS;
                                                                }

(?i:ELSE)                                                       {   
                                                                    return ELSE;
                                                                }

(?i:FI)                                                         {   
                                                                    return FI; 
                                                                }

(?i:IF)                                                         {   
                                                                    return IF; 
                                                                }

(?i:IN)                                                         {   
                                                                    return IN; 
                                                                }

(?i:INHERITS)                                                   {   
                                                                    return INHERITS;
                                                                }

(?i:ISVOID)                                                     {   
                                                                    return ISVOID;
                                                                }

(?i:LET)                                                        {   
                                                                    return LET;
                                                                }

(?i:LOOP)                                                       {   
                                                                    return LOOP;
                                                                }

(?i:POOL)                                                       {   
                                                                    return POOL;
                                                                }

(?i:THEN)                                                       {   
                                                                    return THEN;
                                                                }

(?i:WHILE)                                                      {   
                                                                    return WHILE;
                                                                }

(?i:CASE)                                                       {   
                                                                    return CASE;
                                                                }

(?i:ESAC)                                                       {   
                                                                    return ESAC;
                                                                }

(?i:NEW)                                                        {   
                                                                    return NEW;
                                                                }

(?i:OF)                                                         {   
                                                                    return OF;
                                                                }

(?i:NOT)                                                        {   
                                                                    return NOT;
                                                                }

t(?i:rue)                                                       { 
                                                                    cool_yylval.boolean = 1;
                                                                    return BOOL_CONST; 
                                                                }

f(?i:alse)                                                      {   cool_yylval.boolean = 0;
                                                                    return BOOL_CONST; 
                                                                }


 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */

  /* 只有在INITIAL状态下， 遇到\"才进入STRING状态;
    将识别内容存储到yytext                      */
<INITIAL>\"                                                     {
                                                                    BEGIN STRING;
                                                                    yymore();
                                                                }
 
 /* 识别普通字符 */
<STRING>[^\\\"\n]*                                              {
                                                                    yymore();
                                                                }


 /* 转义字符 */
<STRING>\\[^\n]                                                 {
                                                                    yymore();
                                                                }

 /* 换行 */
<STRING>\\\n                                                    {
                                                                    curr_lineno++;
                                                                    yymore();
                                                                }

 /* 涉及到curr_lineno++, 必须直接处理 */
<STRING>\n                                                      {
                                                                    cool_yylval.error_msg = "Unterminated string constant";
                                                                    curr_lineno++;
                                                                    BEGIN 0;
                                                                    return ERROR;
                                                                }

 /* 结束符直接报错 */
<STRING><<EOF>>                                                 {
                                                                    cool_yylval.error_msg = "EOF in string constant";
                                                                    BEGIN 0;
                                                                    yyrestart(yyin);  
                                                                    return ERROR;
                                                                }


 /* 处理字符串 */
<STRING>\"                                                      {
                                                                    std::string str(yytext, yyleng);
                                                                    int n = yyleng;
                                                                    int i = 1;
                                                                    int j = 0;
                                                                    char res[n + 1];

                                                                    //判断是否有\0
                                                                    for (int j = 1; j < n - 1; j++){
                                                                        if (str[j] == '\0'){
                                                                            cool_yylval.error_msg = "String contains null character";
                                                                            BEGIN 0;
                                                                            return ERROR;
                                                                        }
                                                                    }

                                                                    while (i < n - 1){
                                                                        if (str[i] == '\\'){
                                                                            switch(str[i + 1]){
                                                                                case 'b':
                                                                                    res[j++] = '\b';
                                                                                    break;
                                                                                case 't':
                                                                                    res[j++] = '\t';
                                                                                    break;
                                                                                case 'n':
                                                                                    res[j++] = '\n';
                                                                                    break;
                                                                                case 'f':
                                                                                    res[j++] = '\f';
                                                                                    break;
                                                                                default:
                                                                                    res[j++] = str[i + 1];
                                                                                    break;
                                                                            }
                                                                            i += 2;
                                                                        }else{
                                                                            res[j++] = str[i++];
                                                                        }
                                                                    }

                                                                    if (j >= MAX_STR_CONST){
                                                                        cool_yylval.error_msg = "String constant too long";
                                                                        BEGIN 0;
                                                                        return ERROR;
                                                                    }
                                                                    
                                                                    res[j] = '\0';
                                                                    cool_yylval.symbol = stringtable.add_string((char*)res);
                                                                    BEGIN 0;
                                                                    return STR_CONST;
                                                                }

 /*
  * Integers
  */
{DIGIT}+                                                        {   
                                                                    cool_yylval.symbol = inttable.add_string(yytext);
                                                                    return INT_CONST;
                                                                }


[A-Z][0-9a-zA-Z_]*                                              {
                                                                    cool_yylval.symbol = idtable.add_string(yytext);
                                                                    return TYPEID;
                                                                }
+++++++
[a-z][0-9a-zA-Z_]*                                              {   
                                                                    cool_yylval.symbol = idtable.add_string(yytext);
                                                                    return OBJECTID;
                                                                }

 /*
  *  White space
  */
\n                                                              {
                                                                    curr_lineno++;
                                                                }

[ \f\r\t\v]+                                                    {}


 /* 
  * else
  */
.                                                               { 
                                                                    cool_yylval.error_msg = yytext;
                                                                    return ERROR;
                                                                }
%%

