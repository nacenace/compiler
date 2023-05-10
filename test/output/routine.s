	.text
	.file	"main"
	.globl	f
	.p2align	4, 0x90
	.type	f,@function
f:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	testl	%edi, %edi
	je	.LBB0_1
	movl	4(%rsp), %edi
	decl	%edi
	callq	f@PLT
	addl	4(%rsp), %eax
	movl	%eax, (%rsp)
	jmp	.LBB0_3
.LBB0_1:
	movl	$0, (%rsp)
.LBB0_3:
	movl	(%rsp), %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc

	.globl	g
	.p2align	4, 0x90
	.type	g,@function
g:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%edi, 12(%rsp)
	movl	$1, 8(%rsp)
	testl	%edi, %edi
	jle	.LBB1_3
	movl	%edi, %ebx
	leaq	.L__unnamed_1(%rip), %r14
	leaq	.L__unnamed_2(%rip), %r15
	.p2align	4, 0x90
.LBB1_2:
	movl	8(%rsp), %edi
	callq	f@PLT
	movq	%r14, %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%r15, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	8(%rsp), %eax
	incl	%eax
	movl	%eax, 8(%rsp)
	cmpl	%ebx, %eax
	jle	.LBB1_2
.LBB1_3:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	g, .Lfunc_end1-g
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_5(%rip), %rdi
	leaq	x(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	scanf@PLT
	callq	getchar@PLT
	leaq	.L__unnamed_7(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	x(%rip), %edi
	callq	g@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	x,@object
	.local	x
	.comm	x,4,4
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"%d"
	.size	.L__unnamed_1, 3

	.type	.L__unnamed_2,@object
.L__unnamed_2:
	.asciz	"\n"
	.size	.L__unnamed_2, 2

	.type	.L__unnamed_3,@object
.L__unnamed_3:
	.asciz	"Please input one integer x"
	.size	.L__unnamed_3, 27

	.type	.L__unnamed_4,@object
.L__unnamed_4:
	.asciz	"\n"
	.size	.L__unnamed_4, 2

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
	.asciz	"\351\200\222\345\275\222\350\260\203\347\224\250\345\207\275\346\225\260f(X)\347\273\223\346\236\234:"
	.size	.L__unnamed_7, 30

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"\n"
	.size	.L__unnamed_8, 2


	.section	".note.GNU-stack","",@progbits
