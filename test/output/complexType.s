	.text
	.file	"main"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movabsq	$8589934593, %rax
	movq	%rax, arr+4(%rip)
	movabsq	$17179869187, %rax
	movq	%rax, arr+12(%rip)
	movl	$5, arr+20(%rip)
	movabsq	$85899345930, %rax
	movq	%rax, p(%rip)
	leaq	.L__unnamed_1(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	arr+8(%rip), %esi
	leaq	.L__unnamed_2(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	p(%rip), %esi
	leaq	.L__unnamed_5(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	p+4(%rip), %esi
	leaq	.L__unnamed_7(%rip), %rdi
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

	.type	arr,@object
	.local	arr
	.comm	arr,20,16
	.type	p,@object
	.local	p
	.comm	p,8,8
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"\346\225\260\347\273\204\347\254\254\344\272\214\344\270\252\347\232\204\345\200\274:"
	.size	.L__unnamed_1, 23

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
	.asciz	"\347\273\223\346\236\204\344\275\223\347\232\204\345\200\274:"
	.size	.L__unnamed_4, 17

	.type	.L__unnamed_5,@object
.L__unnamed_5:
	.asciz	"%d"
	.size	.L__unnamed_5, 3

	.type	.L__unnamed_6,@object
.L__unnamed_6:
	.asciz	", "
	.size	.L__unnamed_6, 3

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"%d"
	.size	.L__unnamed_7, 3

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"\n"
	.size	.L__unnamed_8, 2


	.section	".note.GNU-stack","",@progbits
