	.text
	.file	"main"
	.globl	gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 16(%rsp)
	movl	%esi, 20(%rsp)
	testl	%esi, %esi
	je	.LBB0_1
	movl	20(%rsp), %edi
	movl	16(%rsp), %eax
	cltd
	idivl	%edi
	movl	%edx, %esi
	callq	gcd@PLT
	jmp	.LBB0_3
.LBB0_1:
	movl	16(%rsp), %eax
.LBB0_3:
	movl	%eax, 12(%rsp)
	movl	12(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc

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
	leaq	x(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	leaq	y(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	movl	x(%rip), %edi
	movl	y(%rip), %esi
	callq	gcd@PLT
	leaq	.L__unnamed_5(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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
	.asciz	"Please input two integers x and y, and I will return you their greatest common divisor."
	.size	.L__unnamed_1, 88

	.type	.L__unnamed_2,@object
.L__unnamed_2:
	.asciz	"\n"
	.size	.L__unnamed_2, 2

	.type	.L__unnamed_3,@object
.L__unnamed_3:
	.asciz	"%d"
	.size	.L__unnamed_3, 3

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
	.asciz	"\n"
	.size	.L__unnamed_6, 2


	.section	".note.GNU-stack","",@progbits
