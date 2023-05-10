	.text
	.file	"main"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.L__unnamed_1(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_2(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	leaq	x(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_5(%rip), %rdi
	leaq	y(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	scanf@PLT
	callq	getchar@PLT
	movl	y(%rip), %esi
	leaq	.L__unnamed_7(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	x(%rip), %esi
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_9(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	x,@object
	.local	x
	.comm	x,4,4
	.type	y,@object
	.local	y
	.comm	y,4,4
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello the world "
	.size	.L__unnamed_1, 17

	.type	.L__unnamed_2,@object
.L__unnamed_2:
	.asciz	"Please input two integers x and y"
	.size	.L__unnamed_2, 34

	.type	.L__unnamed_3,@object
.L__unnamed_3:
	.asciz	"\n"
	.size	.L__unnamed_3, 2

	.type	.L__unnamed_4,@object
.L__unnamed_4:
	.asciz	"%d"
	.size	.L__unnamed_4, 3

	.type	.L__unnamed_5,@object
.L__unnamed_5:
	.asciz	"%d"
	.size	.L__unnamed_5, 3

	.type	.L__unnamed_6,@object
.L__unnamed_6:
	.asciz	"%*[^\n]"
	.size	.L__unnamed_6, 7

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"%d"
	.size	.L__unnamed_7, 3

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"%d"
	.size	.L__unnamed_8, 3

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"\n"
	.size	.L__unnamed_9, 2


	.section	".note.GNU-stack","",@progbits
