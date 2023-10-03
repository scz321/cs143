# start of generated code
	.data
	.align	2
	.globl	class_nameTab
	.globl	Main_protObj
	.globl	Int_protObj
	.globl	String_protObj
	.globl	bool_const0
	.globl	bool_const1
	.globl	_int_tag
	.globl	_bool_tag
	.globl	_string_tag
_int_tag:
	.word	2
_bool_tag:
	.word	3
_string_tag:
	.word	4
	.globl	_MemMgr_INITIALIZER
_MemMgr_INITIALIZER:
	.word	_NoGC_Init
	.globl	_MemMgr_COLLECTOR
_MemMgr_COLLECTOR:
	.word	_NoGC_Collect
	.globl	_MemMgr_TEST
_MemMgr_TEST:
	.word	0
	.word	-1
str_const15:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const6
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const8
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const8
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const9
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"continue"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"halt"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const11
	.ascii	" is prime.\n"
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const12
	.ascii	"2 is trivially prime.\n"
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const11
	.ascii	"./primes.cl"
	.byte	0	
	.align	2
	.word	-1
int_const12:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	22
	.word	-1
int_const11:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	11
	.word	-1
int_const10:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	8
	.word	-1
int_const9:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const8:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	9
	.word	-1
int_const7:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	10
	.word	-1
int_const6:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
int_const5:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const4:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const3:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const2:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	500
	.word	-1
int_const1:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	2
	.word	-1
int_const0:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
bool_const0:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
bool_const1:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	1
class_nameTab:
	.word	str_const9
# child: IO
# child: Int
# child: Bool
# child: String

	.word	str_const10
# child: Main

	.word	str_const11

	.word	str_const12

	.word	str_const13

	.word	str_const14

class_objTab:
	.word	Object_protObj
	.word	Object_init
	.word	IO_protObj
	.word	IO_init
	.word	Int_protObj
	.word	Int_init
	.word	Bool_protObj
	.word	Bool_init
	.word	String_protObj
	.word	String_init
	.word	Main_protObj
	.word	Main_init
Object_dispTab:
	# method # 0
	.word	Object.abort
	# method # 1
	.word	Object.type_name
	# method # 2
	.word	Object.copy
IO_dispTab:
	# method # 0
	.word	Object.abort
	# method # 1
	.word	Object.type_name
	# method # 2
	.word	Object.copy
	# method # 3
	.word	IO.out_string
	# method # 4
	.word	IO.out_int
	# method # 5
	.word	IO.in_string
	# method # 6
	.word	IO.in_int
Int_dispTab:
	# method # 0
	.word	Object.abort
	# method # 1
	.word	Object.type_name
	# method # 2
	.word	Object.copy
Bool_dispTab:
	# method # 0
	.word	Object.abort
	# method # 1
	.word	Object.type_name
	# method # 2
	.word	Object.copy
String_dispTab:
	# method # 0
	.word	Object.abort
	# method # 1
	.word	Object.type_name
	# method # 2
	.word	Object.copy
	# method # 3
	.word	String.length
	# method # 4
	.word	String.concat
	# method # 5
	.word	String.substr
Main_dispTab:
	# method # 0
	.word	Object.abort
	# method # 1
	.word	Object.type_name
	# method # 2
	.word	Object.copy
	# method # 3
	.word	IO.out_string
	# method # 4
	.word	IO.out_int
	# method # 5
	.word	IO.in_string
	# method # 6
	.word	IO.in_int
	# method # 7
	.word	Main.main
	.word	-1
Object_protObj:
	.word	0	# class tag
	.word	3	# size
	.word	Object_dispTab
	.word	-1
IO_protObj:
	.word	1	# class tag
	.word	3	# size
	.word	IO_dispTab
	.word	-1
Int_protObj:
	.word	2	# class tag
	.word	4	# size
	.word	Int_dispTab
	.word	0	# val(0)
	.word	-1
Bool_protObj:
	.word	3	# class tag
	.word	4	# size
	.word	Bool_dispTab
	.word	0	# val(0)
	.word	-1
String_protObj:
	.word	4	# class tag
	.word	5	# size
	.word	String_dispTab
	.word	int_const0	# int(0)
	.word	0	# str(0)
	.word	-1
Main_protObj:
	.word	5	# class tag
	.word	8	# size
	.word	Main_dispTab
	.word	int_const0	# int(0)
	.word	int_const0	# int(0)
	.word	int_const0	# int(0)
	.word	int_const0	# int(0)
	.word	0	# void
	.globl	heap_start
heap_start:
	.word	0
	.text
	.globl	Main_init
	.globl	Int_init
	.globl	String_init
	.globl	Bool_init
	.globl	Main.main
Object_init:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# ret = SELF
	move	$a0 $s0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# return
	jr	$ra	

IO_init:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# init parent
	jal	Object_init

	# ret = SELF
	move	$a0 $s0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# return
	jr	$ra	

Int_init:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# init parent
	jal	Object_init

	# init attrib _val
	# ret = SELF
	move	$a0 $s0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# return
	jr	$ra	

Bool_init:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# init parent
	jal	Object_init

	# init attrib _val
	# ret = SELF
	move	$a0 $s0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# return
	jr	$ra	

String_init:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# init parent
	jal	Object_init

	# init attrib _val
	la	$a0 int_const0
	sw	$a0 12($s0)
	# init attrib _str_field
	# ret = SELF
	move	$a0 $s0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# return
	jr	$ra	

Main_init:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# init parent
	jal	IO_init

	# init attrib out
	# Dispatch. First eval and save the params.
	la	$a0 str_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	# eval the obj in dispatch.
	# Object:
	# It is self.
	move	$a0 $s0

	# if obj = void: abort
	bne	$a0 $zero label0
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label0:
	# Now we locate the method in the dispatch table.
	# t1 = self.dispTab
	lw	$t1 8($a0)

	# t1 = dispTab[offset]
	lw	$t1 12($t1)

	# jumpto out_string
	jalr		$t1

	la	$a0 int_const1
	sw	$a0 12($s0)

	# init attrib testee
	# Object:
	# It is an attribute.
	lw	$a0 12($s0)

	sw	$a0 16($s0)

	# init attrib divisor
	la	$a0 int_const0
	sw	$a0 20($s0)
	# init attrib stop
	la	$a0 int_const2
	sw	$a0 24($s0)

	# init attrib m
	# While loop
	# start:
label1:
	# ACC = pred
	la	$a0 bool_const1
	# extract int inside bool
	lw	$t1 12($a0)

	# if pred == false jumpto finish
	beq	$t1 $zero label2

	# Assign. First eval the expr.
	# Int operation : Add
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	la	$a0 int_const3
	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	add	$t3 $t1 $t2
	sw	$t3 12($a0)

	# Now find the lvalue.
	# It is an attribute.
	sw	$a0 16($s0)
	# Assign. First eval the expr.
	la	$a0 int_const1
	# Now find the lvalue.
	# It is an attribute.
	sw	$a0 20($s0)
	# While loop
	# start:
label3:
	# ACC = pred
	# If statement. First eval condition.
	# Int operation : Less than
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# Int operation : Mul
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	mul	$t3 $t1 $t2
	sw	$t3 12($a0)


	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Pretend that t1 < t2
	la	$a0 bool_const1
	# If t1 < t2 jumpto finish
	blt	$t1 $t2 label5
	la	$a0 bool_const0
label5:
	# extract the bool content from acc to t1
	lw	$t1 12($a0)

	# if t1 == 0 goto false
	beq	$t1 $zero label6

	la	$a0 bool_const0
	# jumpt finish
	b	label7

# False:
label6:
	# If statement. First eval condition.
	# equal
	# First eval e1 and push.
	# Int operation : Sub
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	# Int operation : Mul
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	# Int operation : Div
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	div	$t3 $t1 $t2
	sw	$t3 12($a0)

	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	mul	$t3 $t1 $t2
	sw	$t3 12($a0)

	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	sub	$t3 $t1 $t2
	sw	$t3 12($a0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	la	$a0 int_const0

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	la	$a0 bool_const1
	la	$a1 bool_const0
	jal	equality_test
	# extract the bool content from acc to t1
	lw	$t1 12($a0)

	# if t1 == 0 goto false
	beq	$t1 $zero label8

	la	$a0 bool_const0
	# jumpt finish
	b	label9

# False:
label8:
	la	$a0 bool_const1
# Finish:
label9:
# Finish:
label7:
	# extract int inside bool
	lw	$t1 12($a0)

	# if pred == false jumpto finish
	beq	$t1 $zero label4

	# Assign. First eval the expr.
	# Int operation : Add
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	la	$a0 int_const3
	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	add	$t3 $t1 $t2
	sw	$t3 12($a0)

	# Now find the lvalue.
	# It is an attribute.
	sw	$a0 20($s0)
	# Jumpto start
	b	label3
	# Finish:
label4:
	# ACC = void
	move	$a0 $zero
	# If statement. First eval condition.
	# Int operation : Less than
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# Int operation : Mul
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	# Object:
	# It is an attribute.
	lw	$a0 20($s0)

	jal	Object.copy

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Modify the int inside t2.
	mul	$t3 $t1 $t2
	sw	$t3 12($a0)


	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Pretend that t1 < t2
	la	$a0 bool_const1
	# If t1 < t2 jumpto finish
	blt	$t1 $t2 label10
	la	$a0 bool_const0
label10:
	# extract the bool content from acc to t1
	lw	$t1 12($a0)

	# if t1 == 0 goto false
	beq	$t1 $zero label11

	# Assign. First eval the expr.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)

	# Now find the lvalue.
	# It is an attribute.
	sw	$a0 12($s0)
	# Dispatch. First eval and save the params.
	# Object:
	# It is an attribute.
	lw	$a0 12($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4
	# eval the obj in dispatch.
	# Object:
	# It is self.
	move	$a0 $s0

	# if obj = void: abort
	bne	$a0 $zero label13
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label13:
	# Now we locate the method in the dispatch table.
	# t1 = self.dispTab
	lw	$t1 8($a0)

	# t1 = dispTab[offset]
	lw	$t1 16($t1)

	# jumpto out_int
	jalr		$t1

	# Dispatch. First eval and save the params.
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	# eval the obj in dispatch.
	# Object:
	# It is self.
	move	$a0 $s0

	# if obj = void: abort
	bne	$a0 $zero label14
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label14:
	# Now we locate the method in the dispatch table.
	# t1 = self.dispTab
	lw	$t1 8($a0)

	# t1 = dispTab[offset]
	lw	$t1 12($t1)

	# jumpto out_string
	jalr		$t1

	# jumpt finish
	b	label12

# False:
label11:
	la	$a0 int_const0
# Finish:
label12:
	# If statement. First eval condition.
	# Int operation : Less or equal
	# First eval e1 and push.
	# Object:
	# It is an attribute.
	lw	$a0 24($s0)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# Object:
	# It is an attribute.
	lw	$a0 16($s0)


	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	# Extract the int inside the object.
	lw	$t1 12($t1)
	lw	$t2 12($t2)

	# Pretend that t1 < t2
	la	$a0 bool_const1
	# If t1 < t2 jumpto finish
	ble	$t1 $t2 label15
	la	$a0 bool_const0
label15:
	# extract the bool content from acc to t1
	lw	$t1 12($a0)

	# if t1 == 0 goto false
	beq	$t1 $zero label16

	# Dispatch. First eval and save the params.
	# eval the obj in dispatch.
	la	$a0 str_const3
	# if obj = void: abort
	bne	$a0 $zero label18
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label18:
	# Now we locate the method in the dispatch table.
	# t1 = self.dispTab
	lw	$t1 8($a0)

	# t1 = dispTab[offset]
	lw	$t1 0($t1)

	# jumpto abort
	jalr		$t1

	# jumpt finish
	b	label17

# False:
label16:
	la	$a0 str_const4
# Finish:
label17:
	# Jumpto start
	b	label1
	# Finish:
label2:
	# ACC = void
	move	$a0 $zero
	sw	$a0 28($s0)

	# ret = SELF
	move	$a0 $s0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# return
	jr	$ra	

Main.main:
	# push fp, s0, ra
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)

	# fp now points to the return addr in stack
	addiu	$fp $sp 4

	# SELF = a0
	move	$s0 $a0

	# evaluating expression and put it to ACC
	la	$a0 int_const0

	# pop fp, s0, ra
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12

	# Pop arguments
	addiu	$sp $sp 0

	# return
	jr	$ra	


# end of generated code
