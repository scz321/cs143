#ifndef SEMANT_H_
#define SEMANT_H_

#include <assert.h>
#include <iostream>
#include <unordered_map>
#include <vector>
#include "cool-tree.h"
#include "stringtab.h"
#include "symtab.h"
#include "list.h"

#define TRUE 1
#define FALSE 0

class ClassTable;
typedef ClassTable *ClassTableP;

// This is a structure that may be used to contain the semantic
// information such as the inheritance graph.  You may use it or not as
// you like: it is only here to provide a container for the supplied
// methods.

class ClassTable {

private:
  int semant_errors;
  void install_basic_classes();
  ostream& error_stream;

  //==================st===================
    //新增两个属性，一个用来记录identifier和类的映射关系，一个用来记录
    //符合与符号之间的继承关系
  std::unordered_map<Symbol,Class_> class_table;//这里为什么不直接using namespace std？
  std::unordered_map<Symbol,Symbol> inhert_graph;//第一项是child，因为一个child
  //只能有一个parent，但是一个parent可以有多个child

public:
  ClassTable(Classes);
  int errors() { return semant_errors; }
  ostream& semant_error();
  ostream& semant_error(Class_ c);
  ostream& semant_error(Symbol filename, tree_node *t);

  // add begin
  void add_to_class_table(Class_ c);
  bool is_valid();
  Class_ get_class(Symbol s);
  Symbol get_parent(Symbol child, Symbol name);
  bool check_method(Symbol s1, Symbol s2, Symbol name);
  bool is_class_exit(Symbol s);
  bool is_sub_class(Symbol s1, Symbol s2);
  Symbol lub(Symbol s1, Symbol s2);
  Symbol get_parents(Symbol s, std::vector<Symbol> &v);
  Formals get_formals(Symbol name, Symbol method);
  Symbol get_return_type(Symbol name, Symbol method);
  bool check(Formals formals, std::vector<Symbol> return_type);
  // add end
};


#endif

