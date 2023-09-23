#include <stdio.h>
#include "cool-tree.h"

extern Program ast_root;      // root of the abstract syntax tree
FILE *ast_file = stdin;       // we read the AST from standard input
extern int ast_yyparse(void); // entry point to the AST parser

int cool_yydebug;     // not used, but needed to link with handle_flags
char *curr_filename;

void handle_flags(int argc, char *argv[]);

int main(int argc, char *argv[]) {
  handle_flags(argc,argv);//处理命令行的参数列表
  ast_yyparse();//这里应该是调用词法分析+语法分析，但是我并没有找到与之相关的函数定义
  ast_root->semant();
  ast_root->dump_with_types(cout,0);
}

