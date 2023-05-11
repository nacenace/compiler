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
	movl	a(%rip), %edi
	callq	abs@PLT
	leaq	.L__unnamed_2(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	b(%rip), %xmm0
	callq	fabs@PLT
	leaq	.L__unnamed_5(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$-15, c(%rip)
	movl	$-15, %edi
	callq	abs@PLT
	leaq	.L__unnamed_7(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	a,@object
	.data
	.p2align	2
a:
	.long	4294967294
	.size	a, 4

	.type	b,@object
	.p2align	3
b:
	.quad	-4606056518893174784
	.size	b, 8

	.type	c,@object
	.local	c
	.comm	c,40,16
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"-2\347\232\204\347\273\235\345\257\271\345\200\274: "
	.size	.L__unnamed_1, 17

	.type	.L__unnamed_2,@object
.L__unnamed_2:
	.asciz	"%d"
	.size	.L__unnamed_2, 3

	.type	.L__unnamed_3,@object
.L__unnamed_3:
	.asciz	"\n"
	.size	.L__unnamed_3, 2

	.type	.L__unnamed_4,@object
.L__unnamed_4:
	.asciz	"-5.0\347\232\204\347\273\235\345\257\271\345\200\274: "
	.size	.L__unnamed_4, 19

	.type	.L__unnamed_5,@object
.L__unnamed_5:
	.asciz	"%lf"
	.size	.L__unnamed_5, 4

	.type	.L__unnamed_6,@object
.L__unnamed_6:
	.asciz	"\n"
	.size	.L__unnamed_6, 2

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"%d"
	.size	.L__unnamed_7, 3

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"\n"
	.size	.L__unnamed_8, 2


	.section	".note.GNU-stack","",@progbits
