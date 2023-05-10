	.text
	.file	"main"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$10, i(%rip)
	movabsq	$4614253070214989087, %rax
	movq	%rax, r(%rip)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_2
	leaq	.L__unnamed_1(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %esi
	leaq	.L__unnamed_2(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_2:
	leaq	.L__unnamed_4(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	r(%rip), %xmm0
	leaq	.L__unnamed_5(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorps	%xmm0, %xmm0
	cvtsi2sdl	i(%rip), %xmm0
	movsd	%xmm0, r(%rip)
	leaq	.L__unnamed_7(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	r(%rip), %xmm0
	leaq	.L__unnamed_8(%rip), %rdi
	movb	$1, %al
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

	.type	i,@object
	.local	i
	.comm	i,4,4
	.type	r,@object
	.local	r
	.comm	r,8,8
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"i is an integer: "
	.size	.L__unnamed_1, 18

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
	.asciz	"\346\212\212i\350\265\213\347\273\231\345\256\236\346\225\260\345\236\213\345\217\230\351\207\217r\345\211\215,r\347\232\204\345\200\274: "
	.size	.L__unnamed_4, 40

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
	.asciz	"\346\212\212i\350\265\213\347\273\231\345\256\236\346\225\260\345\236\213\345\217\230\351\207\217r\345\220\216,r\347\232\204\345\200\274: "
	.size	.L__unnamed_7, 40

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"%lf"
	.size	.L__unnamed_8, 4

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"\n"
	.size	.L__unnamed_9, 2


	.section	".note.GNU-stack","",@progbits
