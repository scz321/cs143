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
str_const11:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const3
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const3
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const5
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const6
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const8
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const8
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const9
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"./not.cl"
	.byte	0	
	.align	2
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
	.word	2
	.word	-1
int_const5:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
int_const4:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const3:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const2:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const1:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	100
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
	.word	str_const5
# child: IO
# child: Int
# child: Bool
# child: String
# child: Main

	.word	str_const6

	.word	str_const7

	.word	str_const8

	.word	str_const9

	.word	str_const10

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
	.word	3	# size
	.word	Main_dispTab
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
	# Let expr
	# First eval init
	la	$a0 int_const0
	# push
	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Let expr
	# First eval init
	move	$a0 $zero
	la	$a0 bool_const0
	# push
	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# While loop
	# start:
label0:
	# ACC = pred
	# Int operation : Less than
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	la	$a0 int_const1

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
	blt	$t1 $t2 label2
	la	$a0 bool_const0
label2:
	# extract int inside bool
	lw	$t1 12($a0)

	# if pred == false jumpto finish
	beq	$t1 $zero label1

	# equal
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 4($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label3
	# Load false
	la	$a0 bool_const0
	# finish:
label3:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label4
	# Load false
	la	$a0 bool_const0
	# finish:
label4:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label5
	# Load false
	la	$a0 bool_const0
	# finish:
label5:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label6
	# Load false
	la	$a0 bool_const0
	# finish:
label6:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label7
	# Load false
	la	$a0 bool_const0
	# finish:
label7:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label8
	# Load false
	la	$a0 bool_const0
	# finish:
label8:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label9
	# Load false
	la	$a0 bool_const0
	# finish:
label9:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label10
	# Load false
	la	$a0 bool_const0
	# finish:
label10:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label11
	# Load false
	la	$a0 bool_const0
	# finish:
label11:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label12
	# Load false
	la	$a0 bool_const0
	# finish:
label12:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label13
	# Load false
	la	$a0 bool_const0
	# finish:
label13:

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	la	$a0 bool_const1
	la	$a1 bool_const0
	jal	equality_test
	# equal
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 4($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label14
	# Load false
	la	$a0 bool_const0
	# finish:
label14:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label15
	# Load false
	la	$a0 bool_const0
	# finish:
label15:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label16
	# Load false
	la	$a0 bool_const0
	# finish:
label16:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label17
	# Load false
	la	$a0 bool_const0
	# finish:
label17:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label18
	# Load false
	la	$a0 bool_const0
	# finish:
label18:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label19
	# Load false
	la	$a0 bool_const0
	# finish:
label19:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label20
	# Load false
	la	$a0 bool_const0
	# finish:
label20:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label21
	# Load false
	la	$a0 bool_const0
	# finish:
label21:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label22
	# Load false
	la	$a0 bool_const0
	# finish:
label22:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label23
	# Load false
	la	$a0 bool_const0
	# finish:
label23:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label24
	# Load false
	la	$a0 bool_const0
	# finish:
label24:

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	la	$a0 bool_const1
	la	$a1 bool_const0
	jal	equality_test
	# equal
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 4($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label25
	# Load false
	la	$a0 bool_const0
	# finish:
label25:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label26
	# Load false
	la	$a0 bool_const0
	# finish:
label26:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label27
	# Load false
	la	$a0 bool_const0
	# finish:
label27:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label28
	# Load false
	la	$a0 bool_const0
	# finish:
label28:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label29
	# Load false
	la	$a0 bool_const0
	# finish:
label29:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label30
	# Load false
	la	$a0 bool_const0
	# finish:
label30:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label31
	# Load false
	la	$a0 bool_const0
	# finish:
label31:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label32
	# Load false
	la	$a0 bool_const0
	# finish:
label32:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label33
	# Load false
	la	$a0 bool_const0
	# finish:
label33:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label34
	# Load false
	la	$a0 bool_const0
	# finish:
label34:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label35
	# Load false
	la	$a0 bool_const0
	# finish:
label35:

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	la	$a0 bool_const1
	la	$a1 bool_const0
	jal	equality_test
	# equal
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 4($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label36
	# Load false
	la	$a0 bool_const0
	# finish:
label36:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label37
	# Load false
	la	$a0 bool_const0
	# finish:
label37:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label38
	# Load false
	la	$a0 bool_const0
	# finish:
label38:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label39
	# Load false
	la	$a0 bool_const0
	# finish:
label39:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label40
	# Load false
	la	$a0 bool_const0
	# finish:
label40:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label41
	# Load false
	la	$a0 bool_const0
	# finish:
label41:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label42
	# Load false
	la	$a0 bool_const0
	# finish:
label42:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label43
	# Load false
	la	$a0 bool_const0
	# finish:
label43:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label44
	# Load false
	la	$a0 bool_const0
	# finish:
label44:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label45
	# Load false
	la	$a0 bool_const0
	# finish:
label45:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label46
	# Load false
	la	$a0 bool_const0
	# finish:
label46:

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	la	$a0 bool_const1
	la	$a1 bool_const0
	jal	equality_test
	# equal
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 4($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2.
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# the 'not' operator
	# First eval the bool
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label47
	# Load false
	la	$a0 bool_const0
	# finish:
label47:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label48
	# Load false
	la	$a0 bool_const0
	# finish:
label48:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label49
	# Load false
	la	$a0 bool_const0
	# finish:
label49:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label50
	# Load false
	la	$a0 bool_const0
	# finish:
label50:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label51
	# Load false
	la	$a0 bool_const0
	# finish:
label51:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label52
	# Load false
	la	$a0 bool_const0
	# finish:
label52:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label53
	# Load false
	la	$a0 bool_const0
	# finish:
label53:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label54
	# Load false
	la	$a0 bool_const0
	# finish:
label54:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label55
	# Load false
	la	$a0 bool_const0
	# finish:
label55:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label56
	# Load false
	la	$a0 bool_const0
	# finish:
label56:
	# Extract the int inside the bool
	lw	$t1 12($a0)
	# Pretend ACC = false, then we need to construct true
	la	$a0 bool_const1
	# If ACC = false, jumpto finish
	beq	$t1 $zero label57
	# Load false
	la	$a0 bool_const0
	# finish:
label57:

	# Let's pop e1 to t1, move e2 to t2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0

	la	$a0 bool_const1
	la	$a1 bool_const0
	jal	equality_test
	# Assign. First eval the expr.
	# Int operation : Add
	# First eval e1 and push.
	# Object:
	# It is a let variable.
	lw	$a0 8($sp)

	sw	$a0 0($sp)
	addiu	$sp $sp -4

	# Then eval e2 and make a copy for result.
	la	$a0 int_const2
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
	# It is a let variable.
	sw	$a0 8($sp)
	# Jumpto start
	b	label0
	# Finish:
label1:
	# ACC = void
	move	$a0 $zero
	# If statement. First eval condition.
	# Object:
	# It is a let variable.
	lw	$a0 4($sp)

	# extract the bool content from acc to t1
	lw	$t1 12($a0)

	# if t1 == 0 goto false
	beq	$t1 $zero label58

	# Dispatch. First eval and save the params.
	# eval the obj in dispatch.
	# Object:
	# It is self.
	move	$a0 $s0

	# if obj = void: abort
	bne	$a0 $zero label60
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label60:
	# Now we locate the method in the dispatch table.
	# t1 = self.dispTab
	lw	$t1 8($a0)

	# t1 = dispTab[offset]
	lw	$t1 0($t1)

	# jumpto abort
	jalr		$t1

	# jumpt finish
	b	label59

# False:
label58:
	la	$a0 int_const0
# Finish:
label59:
	# pop
	addiu	$sp $sp 4

	# pop
	addiu	$sp $sp 4


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
