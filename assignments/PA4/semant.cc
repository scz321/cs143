

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "semant.h"
#include "utilities.h"
#include <stack>
#include <unordered_set>
#include <vector>

extern int semant_debug;
extern char *curr_filename;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
static Symbol 
    arg,
    arg2,
    Bool,
    concat,
    cool_abort,
    copy,
    Int,
    in_int,
    in_string,
    IO,
    length,
    Main,
    main_meth,
    No_class,
    No_type,
    Object,
    out_int,
    out_string,
    prim_slot,
    self,
    SELF_TYPE,
    Str,
    str_field,
    substr,
    type_name,
    val;
//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
    arg         = idtable.add_string("arg");
    arg2        = idtable.add_string("arg2");
    Bool        = idtable.add_string("Bool");
    concat      = idtable.add_string("concat");
    cool_abort  = idtable.add_string("abort");
    copy        = idtable.add_string("copy");
    Int         = idtable.add_string("Int");
    in_int      = idtable.add_string("in_int");
    in_string   = idtable.add_string("in_string");
    IO          = idtable.add_string("IO");
    length      = idtable.add_string("length");
    Main        = idtable.add_string("Main");
    main_meth   = idtable.add_string("main");
    //   _no_class is a symbol that can't be the name of any 
    //   user-defined class.
    No_class    = idtable.add_string("_no_class");
    No_type     = idtable.add_string("_no_type");
    Object      = idtable.add_string("Object");
    out_int     = idtable.add_string("out_int");
    out_string  = idtable.add_string("out_string");
    prim_slot   = idtable.add_string("_prim_slot");
    self        = idtable.add_string("self");
    SELF_TYPE   = idtable.add_string("SELF_TYPE");
    Str         = idtable.add_string("String");
    str_field   = idtable.add_string("_str_field");
    substr      = idtable.add_string("substr");
    type_name   = idtable.add_string("type_name");
    val         = idtable.add_string("_val");
}



ClassTable::ClassTable(Classes classes) : semant_errors(0) , error_stream(cerr) {

    /* Fill this in */
    //这里的逻辑较为简单，只需要:1、初始化内置的数据类型
    //2、遍历AST中的classes，全部加入
    install_basic_classes();
    
    for (int i = classes->first(); classes->more(i); i = classes->next(i)){
        add_to_class_table(classes->nth(i));
    }
}

void ClassTable::install_basic_classes() {

    // The tree package uses these globals to annotate the classes built below.
   // curr_lineno  = 0;
    Symbol filename = stringtable.add_string("<basic class>");
    
    // The following demonstrates how to create dummy parse trees to
    // refer to basic Cool classes.  There's no need for method
    // bodies -- these are already built into the runtime system.
    
    // IMPORTANT: The results of the following expressions are
    // stored in local variables.  You will want to do something
    // with those variables at the end of this method to make this
    // code meaningful.

    // 
    // The Object class has no parent class. Its methods are
    //        abort() : Object    aborts the program
    //        type_name() : Str   returns a string representation of class name
    //        copy() : SELF_TYPE  returns a copy of the object
    //
    // There is no need for method bodies in the basic classes---these
    // are already built in to the runtime system.

    Class_ Object_class =
	class_(Object, 
	       No_class,
	       append_Features(
			       append_Features(
					       single_Features(method(cool_abort, nil_Formals(), Object, no_expr())),
					       single_Features(method(type_name, nil_Formals(), Str, no_expr()))),
			       single_Features(method(copy, nil_Formals(), SELF_TYPE, no_expr()))),
	       filename);

    // 
    // The IO class inherits from Object. Its methods are
    //        out_string(Str) : SELF_TYPE       writes a string to the output
    //        out_int(Int) : SELF_TYPE            "    an int    "  "     "
    //        in_string() : Str                 reads a string from the input
    //        in_int() : Int                      "   an int     "  "     "
    //
    Class_ IO_class = 
	class_(IO, 
	       Object,
	       append_Features(
			       append_Features(
					       append_Features(
							       single_Features(method(out_string, single_Formals(formal(arg, Str)),
										      SELF_TYPE, no_expr())),
							       single_Features(method(out_int, single_Formals(formal(arg, Int)),
										      SELF_TYPE, no_expr()))),
					       single_Features(method(in_string, nil_Formals(), Str, no_expr()))),
			       single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
	       filename);  

    //
    // The Int class has no methods and only a single attribute, the
    // "val" for the integer. 
    //
    Class_ Int_class =
	class_(Int, 
	       Object,
	       single_Features(attr(val, prim_slot, no_expr())),
	       filename);

    //
    // Bool also has only the "val" slot.
    //
    Class_ Bool_class =
	class_(Bool, Object, single_Features(attr(val, prim_slot, no_expr())),filename);

    //
    // The class Str has a number of slots and operations:
    //       val                                  the length of the string
    //       str_field                            the string itself
    //       length() : Int                       returns length of the string
    //       concat(arg: Str) : Str               performs string concatenation
    //       substr(arg: Int, arg2: Int): Str     substring selection
    //       
    Class_ Str_class =
	class_(Str, 
	       Object,
	       append_Features(
			       append_Features(
					       append_Features(
							       append_Features(
									       single_Features(attr(val, Int, no_expr())),
									       single_Features(attr(str_field, prim_slot, no_expr()))),
							       single_Features(method(length, nil_Formals(), Int, no_expr()))),
					       single_Features(method(concat, 
								      single_Formals(formal(arg, Str)),
								      Str, 
								      no_expr()))),
			       single_Features(method(substr, 
						      append_Formals(single_Formals(formal(arg, Int)), 
								     single_Formals(formal(arg2, Int))),
						      Str, 
						      no_expr()))),
	       filename);
}

////////////////////////////////////////////////////////////////////
//
// semant_error is an overloaded function for reporting errors
// during semantic analysis.  There are three versions:
//
//    ostream& ClassTable::semant_error()                
//
//    ostream& ClassTable::semant_error(Class_ c)
//       print line number and filename for `c'
//
//    ostream& ClassTable::semant_error(Symbol filename, tree_node *t)  
//       print a line number and filename
//
///////////////////////////////////////////////////////////////////

ostream& ClassTable::semant_error(Class_ c)
{                                                             
    return semant_error(c->get_filename(),c);
}    

ostream& ClassTable::semant_error(Symbol filename, tree_node *t)
{
    error_stream << filename << ":" << t->get_line_number() << ": ";
    return semant_error();
}

ostream& ClassTable::semant_error()                  
{                                                 
    semant_errors++;                            
    return error_stream;
} 











/*   This is the entry point to the semantic checker.

     Your checker should do the following two things:

     1) Check that the program is semantically correct
     2) Decorate the abstract syntax tree with type information
        by setting the `type' field in each Expression node.
        (see `tree.h')

     You are free to first do 1), make sure you catch all semantic
     errors. Part 2) can be done in a second stage, when you want
     to build mycoolc.
 */
void program_class::semant()
{
    initialize_constants();

    /* ClassTable constructor may do some semantic analysis */
    ClassTable *classtable = new ClassTable(classes);

    /* some semantic analysis code may go here */

    if (classtable->errors()) {
	cerr << "Compilation halted due to static semantic errors." << endl;
	exit(1);
    }
}


// start
// add class to classtable
void ClassTable::add_to_class_table(Class_ c){
    Symbol name = c->get_name();
    Symbol parent = c->get_parent();
    Features features = c->get_features();
    Symbol filename = c->get_filename();
    if ((parent == Bool) || (parent == Str) || (parent == SELF_TYPE)){
        // 不能从bool, string, self_type继承
        semant_error(c) << name << "Can't inherent from " << parent << "!" << endl; 
    }else if (name == SELF_TYPE){
        // 不能定义self_type
        semant_error(c) << "Can't define SELF_TYPE!" << endl;
    }else if ((class_table.find(name) != class_table.end()) ||
              (inhert_graph.find(name) != inhert_graph.end())){
        // 不能重复定义
        semant_error(c) << "Can't be defined multiple times!" << endl;
    }else{
        class_table[name] = c;
        inhert_graph[name] = parent;
    }
}



/**
 * 判断定义是否合理：
 * 1. 不含环。
 * 2. 判断是否包含Main。
 * 3. 判断父类是否都已定义。
 **/
bool ClassTable::is_valid(){
    bool cycle_flag = true;
    bool main_flag = false;
    bool define_flag = true;
    for (auto it = inhert_graph.begin(); it != inhert_graph.end(); it++){
        Symbol child = it->first;
        Symbol parent = it->second;
        // 判断是否包含main
        if (child == Main){
            main_flag = true;
        }
        // Object的parent为No_class, 该条件判断是否为根
        while (parent != No_class){
            // 环
            if (parent == child){
                semant_error(class_table[child]) << "Has cycle!" << endl;
                return false;
            }
            // 不存在父节点
            if (!inhert_graph.count(parent)){
                semant_error(class_table[child]) << "Doesn't contain parent!" << endl;
                return false;
            }
            parent = inhert_graph[parent];
        }
    }

    if (main_flag){
        return true;
    }else{
        semant_error() << "Class Main is not defined." << endl;
        return false;
    }
}


//剩下的都是一些功能函数
// 获得s对应的类
Class_ ClassTable::get_class(Symbol s){
    return class_table[s];
}

// 找到有方法name的父类
Symbol ClassTable::get_parent(Symbol child, Symbol name){
    Symbol parent = inhert_graph[child];
    // 保证
    while (parent != No_class){
        // test 4
        Class_ parent_class = class_table[parent];
        if (parent_class->get_method(name)){
            return parent_class->get_name();
        }
        parent = inhert_graph[parent];
    }

    return NULL;
};

// 判断s1和s2的方法name是否相同
bool ClassTable::check_method(Symbol s1, Symbol s2, Symbol name){
    Class_ c1 = class_table[s1];
    Class_ c2 = class_table[s2];
    Feature f1 = c1->get_method(name);
    Feature f2 = c2->get_method(name);
    Formals fo1 = f1->get_formals();
    Formals fo2 = f2->get_formals();
    Symbol rt1 = f1->get_return_type();
    Symbol rt2 = f2->get_return_type();

    // 返回类型
    if (rt1 != rt2){
        return false;
    }

    // 判断输入参数类型
    int i = fo1->first();
    int j = fo2->first();

    while ((fo1->more(i)) && (fo2->more(j))) {
        if (fo1->nth(i)->get_type() != fo2->nth(j)->get_type()){
            return false;
        }
        i = fo1->next(i);
        j = fo2->next(j);
    }

    if (fo1->more(i) || fo2->more(j)){
        return false;
    }

    return true;
}

// 判断类是否存在
bool ClassTable::is_class_exit(Symbol s){
    return inhert_graph.count(s);
}

// 判断s1是否是s2的子类
bool ClassTable::is_sub_class(Symbol s1, Symbol s2){
    if (s2 == Object){
        return true;
    }
    // 判断s1是否为空
    while (s1 != NULL){
        if (s1 == s2){
            return true;
        }
        s1 = inhert_graph[s1];
    }

    return false;
}

// 获得所有父节点
Symbol ClassTable::get_parents(Symbol s, std::vector<Symbol> &v){
    while (s != No_class){
        v.push_back(s);
        s = inhert_graph[s];
    }
}

// 层数最低的公共祖先
Symbol ClassTable::lub(Symbol s1, Symbol s2){
    Symbol res = Object;
    std::vector<Symbol> v1;
    std::vector<Symbol> v2;
    get_parents(s1, v1);
    get_parents(s2, v2);
    int n1 = v1.size();
    int n2 = v2.size();
    int i = n1 - 1;
    int j = n2 - 1;
    while ((i >= 0) && (j >= 0) && (v1[i] == v2[j])){
        res = v1[i];
        i--;
        j--;
    }

    return res;
}


// 找到类名为name, 方法名为method的formals
Formals ClassTable::get_formals(Symbol name, Symbol method){
    Symbol c = name;
    while (c != No_class){
        // 获得类
        Class_ c_class = class_table[c];
        // 判断是否有方法
        if (c_class->get_method(method)){
            Formals f = c_class->get_method(method)->get_formals();
            if (f != NULL){
                return f;
            }
        }

        c = inhert_graph[c];
    }

    return NULL;
}

// 找到类名为name, 方法名为method的return_type
Symbol ClassTable::get_return_type(Symbol name, Symbol method){
    Symbol c = name;
    while (c != No_class){
        // 获得类
        Class_ c_class = class_table[c];
        // 判断是否有方法
        if (c_class->get_method(method)){
            Symbol f = c_class->get_method(method)->get_return_type();
            if (f != NULL){
                return f;
            }
        }

        c = inhert_graph[c];
    }

    return NULL;
}

// 判断par_types中元素是否为formals中对应元素的子类
bool ClassTable::check(Formals formals, std::vector<Symbol> par_types){
    int i = formals->first();
    int j = 0;
    int n = par_types.size();
    while (formals->more(i) && (j < n)){
        if (!is_sub_class(par_types[j], formals->nth(i)->get_type())){
            return false;
        }
        j++;
        i = formals->next(i);
    }
    if ((j < n) || (formals->more(i))){
        return false;
    }

    return true;
}

// class__class, 初始化, 递归处理, 先设置父节点
void class__class::init(Env env){
    if (name != Object){
        // 先设置父节点
        env.ct->get_class(parent)->init(env);
    }

    // 设置feature
    for (int i = features->first(); features->more(i); i = features->next(i)){
        features->nth(i)->add_to_env(env);
    }
}

// not use
bool class__class::has_method(Symbol name) {
    for (int i = features->first(); features->more(i); i = features->next(i)){
        if ((features->nth(i)->is_method()) && (features->nth(i)->get_name() == name)){
            return true;
        }
    }

    return false;
}

// 获得方法
Feature class__class::get_method(Symbol name) {
    for (int i = features->first(); features->more(i); i = features->next(i)){
        if ((features->nth(i)->is_method()) && (features->nth(i)->get_name() == name)){
            return features->nth(i);
        }
    }

    return NULL;
}

// method_class
void method_class::add_to_env(Env env){
 //对于method的add_to_env,这里应该是一处bug，商代修复
}

// attr_class
void attr_class::add_to_env(Env env){
    if (env.om->probe(name) == NULL){
        // 如果scope中属性未定义, 则直接定义
        env.om->addid(name, &type_decl);
    }else{
        // 如果scope中属性已定义, 则报错
        env.ct->semant_error(env.cur_class) << "Can't be defined multiple times!" << endl;
    }
}

/** type_check **/
// class__class
Class_ class__class::type_check(Env env){
    for (int i = features->first(); features->more(i); i = features->next(i)){
        features->nth(i)->type_check(env);
    }

    return this;
}

/**
 * 1. 进入新的作用域
 * 2. 添加当前类到环境
 * 3. 遍历变量
 * 4. 判断方法是是否继承正确
 * 5. 判断实际返回类型
 *    1. 如果返回类型是SELF_TYPE, 实际返回类型也为SELF_TYPE
 *    2. 返回类型存在
 *    3. 实际返回类型是声明类型的子类
 **/
Feature method_class::type_check(Env env){
    // step1
    env.om->enterscope();
    // step2
    Symbol cur_class = env.cur_class->get_name();
    env.om->addid(self, &cur_class);
    // step3
    for (int i = formals->first(); formals->more(i); i = formals->next(i)){
        formals->nth(i)->type_check(env);
    }
    // step4
    // 首先获得包含当前method的父类, 然后查看是否和父类method匹配
    // 获得包含method的父类
    Symbol parent_class = env.ct->get_parent(cur_class, name);
    if (parent_class != NULL){
        // 判断方法是否继承正确
        if(!env.ct->check_method(cur_class, parent_class, name)){
            env.ct->semant_error(env.cur_class) << "Method " << name << "inherent wrong!" << endl;
        }
    }
    // step5
    Symbol true_return_type = expr->type_check(env)->type;
    if (return_type == SELF_TYPE){
        // 5.1
        if (true_return_type != SELF_TYPE){
            env.ct->semant_error(env.cur_class) << "True return type should be SELF_TYPE!" << endl;
        }
    }else if (!env.ct->is_class_exit(return_type)){
        // 5.2
        env.ct->semant_error(env.cur_class) << "Return type doesn't exist!" << endl;
    }else{
        // 5.3
        if (true_return_type == SELF_TYPE){
            true_return_type = env.cur_class->get_name();
        }
        if (!env.ct->is_sub_class(true_return_type, return_type)){
            env.ct->semant_error(env.cur_class->get_filename(), this) << "True return type isn't subclass of return type!" << endl;
        }
    }
    
    // step1
    env.om->exitscope();

    return this;
}

/**
 * 1. 进入新的作用域
 * 2. 添加当前类到环境
 * 3. 计算init,
 *    1. 判断不是self
 *    2. 如果返回类型为SELF_TYPE, 则返回类型为当前类
 *    3. 判断其返回类型是否为type_decl子类
 **/
Feature attr_class::type_check(Env env){
    // step1
    env.om->enterscope();
    // step2
    Symbol cur_class = env.cur_class->get_name();
    env.om->addid(self, &cur_class);
    // step3
    Symbol true_return_type = init->type_check(env)->type;
    // 3.1
    if (name == self){
        env.ct->semant_error(env.cur_class->get_filename(), this) << "Attr shouldn't be self!" << endl;
    }
    // 3.2
    // SELF_TYPE的类型为自身
    if (true_return_type == SELF_TYPE){
        true_return_type = env.cur_class->get_name();
    }
    // 3.3
    // 判断是否为type_decl的子类, 排除No_type
    if (true_return_type != No_type){
        if (!(env.ct->is_sub_class(true_return_type, type_decl))){
            env.ct->semant_error(env.cur_class) << "True attr type isn't subcalss of type_decl!" << endl;
        }
    }

    // step1
    env.om->exitscope();

    return this;
}

/**
 * 1. 判断参数是否存在
 * 2. 判断类型是否为SELF_TYPE
 * 3. 添加到om中
 * 
 **/
Formal formal_class::type_check(Env env){
    if (env.om->probe(name)){
        env.ct->semant_error(env.cur_class) << "Name already exist!" << endl;
    }else if (type_decl == SELF_TYPE){
        env.ct->semant_error(env.cur_class) << "Type shouldn't be SELF_TYPE!" << endl;
    }else{
        env.om->addid(name, &type_decl);
    }

    return this;
}


/**
 * branch
 * ID : TYPE => expr
 * name : type_decl => expr
 **/
Symbol branch_class::type_check(Env env){
    if (env.om->probe(name)){
        env.ct->semant_error(env.cur_class) << "Name already exist!" << endl;
        return Object;
    }
    env.om->addid(name, &type_decl);

    return expr->type_check(env)->type;
}

/**
 * assign
 * OBJECTID ASSIGN expr
 * name = expr
 **/
Expression assign_class::type_check(Env env){
    Symbol expect_type = *env.om->lookup(name);
    Symbol true_type = expr->type_check(env)->type;
    if (env.ct->is_sub_class(true_type, expect_type)){
        type = true_type;
    }else{
        env.ct->semant_error(env.cur_class) << "Assign error!" << endl;
        type = Object;
    }

    return this;
}

/**
 * static_dispatch
 * expr@TYPEID.OBJECTID(actual)
 * expr@name.name(actual)
 **/
Expression static_dispatch_class::type_check(Env env){
    // step1
    Symbol t0 = expr->type_check(env)->type;
    if (env.ct->is_sub_class(t0, type_name)){
        // 当前类型
        Symbol cur_class = t0;
        if (t0 == SELF_TYPE){
            cur_class = env.cur_class->get_name();
        }
        // step2
        // 获得参数的类型
        std::vector<Symbol> par_types;
        for (int i = actual->first(); actual->more(i); i = actual->next(i)){
            Symbol t = actual->nth(i)->type_check(env)->type;//看，又是对expr的type_check!!
            if (t == SELF_TYPE){
                t = env.cur_class->get_name();
            }
            par_types.push_back(t);
        }
        // 获得参数列表
        Formals formals = env.ct->get_formals(cur_class, name);
        Symbol return_type = env.ct->get_return_type(cur_class, name);
        // 方法定义有误
        if ((formals == NULL) || (return_type == NULL)){
            env.ct->semant_error(env.cur_class) << "Method define wrong!" << endl;
            type = Object;//这其实可以算作是一处错误处理

            return this;
        }
        // step4
        if (!env.ct->check(formals, par_types)){
            env.ct->semant_error(env.cur_class) << "Par type define wrong!" << endl;
            type = Object;

            return this;
        }
        // 更新type
        if (return_type == SELF_TYPE){
            type = t0;
        }else{
            type = return_type;
        }

        return this;
    }else{
        env.ct->semant_error(env.cur_class) << "Wrong class!" << endl;
        type = Object;

        return this;
    }
}

/**
 * dispatch
 * expr.name(actual)
 * 1. eval expr, 判断是否存在
 * 2. eval actual, 获得参数类型
 * 3. 判断方法是否定义有误
 * 4. 判断actual的类型是否匹配
 **/ 
Expression dispatch_class::type_check(Env env){
    // step1
    Symbol t0 = expr->type_check(env)->type;
    // 当前类型
    Symbol cur_class = t0;
    if (t0 == SELF_TYPE){
        cur_class = env.cur_class->get_name();
    }
    // step2
    // 获得参数的类型
    std::vector<Symbol> par_types;
    for (int i = actual->first(); actual->more(i); i = actual->next(i)){
        Symbol t = actual->nth(i)->type_check(env)->type;
        if (t == SELF_TYPE){
            t = env.cur_class->get_name();
        }
        par_types.push_back(t);
    }
    // 获得参数列表
    Formals formals = env.ct->get_formals(cur_class, name);
    Symbol return_type = env.ct->get_return_type(cur_class, name);
    // 方法定义有误
    if ((formals == NULL) || (return_type == NULL)){
        env.ct->semant_error(env.cur_class) << "Method define wrong!" << endl;
        type = Object;

        return this;
    }
    // step4
    if (!env.ct->check(formals, par_types)){
        env.ct->semant_error(env.cur_class) << "Par type define wrong!" << endl;
        type = Object;

        return this;
    }

    // 更新type
    if (return_type == SELF_TYPE){
        type = t0;
    }else{
        type = return_type;
    }

    return this;
}

/**
 * cond
 * IF expr THEN expr ELSE expr FI
 * if pred then then_exp else else_exp fi
 **/
Expression cond_class::type_check(Env env){
    Symbol t0 = pred->type_check(env)->type;
    Symbol t1 = then_exp->type_check(env)->type;
    Symbol t2 = else_exp->type_check(env)->type;
    if (t1 == SELF_TYPE){
        t1 = env.cur_class->get_name();
    }
    if (t2 == SELF_TYPE){
        t2 = env.cur_class->get_name();
    }
    if (t0 != Bool){
        env.ct->semant_error(env.cur_class) << "Pre type should be bool!" << endl;
        type = Object;
    }else{
        type = env.ct->lub(t1, t2);
    }

    return this;
}

/**
 * loop
 * while expr loop expr pool
 * while pred loop body pool
 **/
Expression loop_class::type_check(Env env){
    Symbol pred_type = pred->type_check(env)->type;
    Symbol body_type = body->type_check(env)->type;

    type = Object;
    if (pred_type != Bool){
        env.ct->semant_error(env.cur_class) << "Pre type should be bool!" << endl;
    }

    return this;
}

/**
 * case
 * case expr of [[ID : TYPE => expr; ]]+ esac
 * case expr of cases esac
 **/
Expression typcase_class::type_check(Env env){
    Symbol expr_type = expr->type_check(env)->type;
    // case不能相同
    for (int i = cases->first(); cases->more(i); i = cases->next(i)){
        for (int j = cases->first(); cases->more(j); j = cases->next(j)){
            if ((i != j) && (cases->nth(i)->get_type() == cases->nth(j)->get_type())){
                env.ct->semant_error(env.cur_class) << "Case should be different!" << endl;
                type = Object;
                return this;
            }
        }
    }
    // lub
    int i = cases->first();
    Symbol s = cases->nth(i)->type_check(env);
    for (; cases->more(i); i = cases->next(i)){
        env.om->enterscope();
        Symbol s1 = cases->nth(i)->type_check(env);
        s = env.ct->lub(s, s1);
        env.om->exitscope();
    }
    type = s;

    return this;
}

/**
 * block class
 * [[expr;]]+
 * body
 **/
Expression block_class::type_check(Env env){
    Symbol s = NULL;
    for (int i = body->first(); body->more(i); i = body->next(i)){
        s = body->nth(i)->type_check(env)->type;
    }
    type = s;

    return this;
}

/**
 * let
 * let ID : TYPE [ <- expr ] [[; ID : TYPE [ <- expr ]]]* in expr
 * let identifier : type_decl <- init in body
 **/
Expression let_class::type_check(Env env){
    if (identifier == self){
        env.ct->semant_error(env.cur_class) << "Self can't be used in let!" << endl;
        type = Object;
    }else{
        Symbol expect_type = type_decl;
        Symbol true_type = init->type_check(env)->type;
        // no init
        if (true_type == No_type){
            env.om->enterscope();
            env.om->addid(identifier, &expect_type);
            Symbol s = body->type_check(env)->type;
            type = s;
            env.om->exitscope();
        }else{
            // 检查返回类型
            if (!env.ct->is_sub_class(true_type, expect_type)){
                env.ct->semant_error(env.cur_class) << "True return type isn't subcalss of return type!" << endl;
                type = Object;
            }else{
                env.om->enterscope();
                env.om->addid(identifier, &expect_type);
                Symbol s = body->type_check(env)->get_type();
                type = s;
                env.om->exitscope();
            }
        }

        return this;
    }
}

// 这部分类规则比较简单, 略过注释
Expression plus_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if ((s1 == Int) && (s2 == Int)){
        type = Int;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should both be int!" << endl;
        type = Object;
    }

    return this;
}

Expression sub_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if ((s1 == Int) && (s2 == Int)){
        type = Int;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should both be int!" << endl;
        type = Object;
    }

    return this;
}

Expression mul_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if ((s1 == Int) && (s2 == Int)){
        type = Int;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should both be int!" << endl;
        type = Object;
    }

    return this;
}

Expression divide_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if ((s1 == Int) && (s2 == Int)){
        type = Int;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should both be int!" << endl;
        type = Object;
    }

    return this;
}

Expression neg_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    if (s1 == Int){
        type = Int;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should be int!" << " " << s1 << endl;
        type = Object;
    }

    return this;
}

Expression lt_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if ((s1 == Int) && (s2 == Int)){
        type = Bool;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should both be int!" << endl;
        type = Object;
    }

    return this;
}

Expression eq_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if ((s1 == Int && s2 != Int) || (s1 != Int && s2 == Int) ||
        (s1 == Str && s2 != Str) || (s1 != Str && s2 == Str) ||
        (s1 == Bool && s2 != Bool) || (s1 != Bool && s2 == Bool)){
        env.ct->semant_error(env.cur_class) << "Can't compare " << s1 << " = " << s2 << endl;
        type = Object;
    }else{
        type = Bool;
    }

    return this;
}

Expression leq_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    Symbol s2 = e2->type_check(env)->type;
    if (((s1 == Int) && (s2 == Int)) ||
        ((s1 == Str) && (s2 == Str)) ||
        ((s1 == Bool) && (s2 == Bool))){
        type = Bool;
    }else{
        env.ct->semant_error(env.cur_class) << "Wrong type!" << endl;
        type = Object;
    }

    return this;
}

Expression comp_class::type_check(Env env){
    Symbol s1 = e1->type_check(env)->type;
    if (s1 == Bool){
        type = Bool;
    }else{
        env.ct->semant_error(env.cur_class) << "Type should be bool!" << endl;
        type = Object;
    }

    return this;
}

Expression int_const_class::type_check(Env env){
    type = Int;

    return this;
}

Expression bool_const_class::type_check(Env env){
    type = Bool;

    return this;
}

Expression string_const_class::type_check(Env env){
    type = Str;

    return this;
}

/**
 * new
 * new TYPE
 * type_name
 **/
Expression new__class::type_check(Env env){
    Symbol s = type_name;
    if (s == SELF_TYPE){
        type = s;
    }else if (env.ct->is_class_exit(s)){
        type = s;
    }else{  
        env.ct->semant_error(env.cur_class) << "Doesn't have class!" << endl;
        type = Object;
    }

    return this;
}

/**
 * isvoid
 * isvoid expr
 * isvoid e1
 **/
Expression isvoid_class::type_check(Env env){
    Symbol s = e1->type_check(env)->type;
    if (!env.ct->is_class_exit(s)){
        env.ct->semant_error(env.cur_class) << "Doesn't have class!" << endl;
        type = Object;
    }
    type = Bool;

    return this;
}

/**
 * no_expr
 * type = No_type
 **/
Expression no_expr_class::type_check(Env env){
    type = No_type;

    return this;
}

/**
 * object(实例化一个类)
 * OBJECTID
 * name
 **/
Expression object_class::type_check(Env env){
    // 重要
    if (name == self){
        type = SELF_TYPE;
    }else if (env.om->lookup(name) != NULL){
        type = *(env.om->lookup(name));
    }else{
        env.ct->semant_error(env.cur_class) << "Doesn't have class!" << endl;
        type = Object;
    }

    return this;
}

