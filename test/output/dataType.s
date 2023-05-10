	.text
	.file	"main"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movb	$1, b(%rip)
	movb	$65, c(%rip)
	movl	$10, i(%rip)
	movabsq	$4614253070214989087, %rax
	movq	%rax, r(%rip)
	leaq	.L__unnamed_1(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_2(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movzbl	c(%rip), %esi
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %esi
	leaq	.L__unnamed_5(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	r(%rip), %xmm0
	leaq	.L__unnamed_7(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_9(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_10(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	b,@object
	.local	b
	.comm	b,1,1
	.type	c,@object
	.local	c
	.comm	c,1,1
	.type	i,@object
	.local	i
	.comm	i,4,4
	.type	r,@object
	.local	r
	.comm	r,8,8
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
	.asciz	"%c"
	.size	.L__unnamed_3, 3

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
	.asciz	"\n"
	.size	.L__unnamed_6, 2

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"%lf"
	.size	.L__unnamed_7, 4

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"\n"
	.size	.L__unnamed_8, 2

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"Hello, world!"
	.size	.L__unnamed_9, 14

	.type	.L__unnamed_10,@object
.L__unnamed_10:
	.asciz	"\n"
	.size	.L__unnamed_10, 2


	.section	".note.GNU-stack","",@progbits
