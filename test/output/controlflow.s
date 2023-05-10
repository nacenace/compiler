	.text
	.file	"main"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
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
	leaq	.L__unnamed_5(%rip), %rdi
	xorl	%eax, %eax
	callq	scanf@PLT
	callq	getchar@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_7(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	x(%rip), %eax
	cmpl	y(%rip), %eax
	jl	.LBB0_3
	movl	x(%rip), %eax
	cmpl	y(%rip), %eax
	jg	.LBB0_4
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_9(%rip), %rdi
	jmp	.LBB0_5
.LBB0_3:
	leaq	.L__unnamed_10(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_11(%rip), %rdi
	jmp	.LBB0_5
.LBB0_4:
	leaq	.L__unnamed_12(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_13(%rip), %rdi
.LBB0_5:
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_14(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_15(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movslq	x(%rip), %rax
	imulq	$1431655766, %rax, %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%ecx, %eax
	je	.LBB0_9
	cmpl	$1, %eax
	je	.LBB0_10
	cmpl	$2, %eax
	jne	.LBB0_12
	movl	two(%rip), %eax
	jmp	.LBB0_11
.LBB0_9:
	movl	zero(%rip), %eax
	jmp	.LBB0_11
.LBB0_10:
	movl	one(%rip), %eax
.LBB0_11:
	movl	%eax, x(%rip)
.LBB0_12:
	leaq	.L__unnamed_16(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	x(%rip), %esi
	leaq	.L__unnamed_17(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_18(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_19(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_20(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$0, i(%rip)
	leaq	.L__unnamed_21(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_22(%rip), %rdi
	movl	$32, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	incl	%eax
	movl	%eax, i(%rip)
	cmpl	$10, %eax
	je	.LBB0_15
	leaq	.L__unnamed_23(%rip), %r14
	leaq	.L__unnamed_24(%rip), %rbx
	.p2align	4, 0x90
.LBB0_14:
	movl	i(%rip), %esi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$32, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	incl	%eax
	movl	%eax, i(%rip)
	cmpl	$10, %eax
	jne	.LBB0_14
.LBB0_15:
	leaq	.L__unnamed_25(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_26(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_27(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	cmpl	$0, i(%rip)
	jle	.LBB0_18
	leaq	.L__unnamed_28(%rip), %r14
	leaq	.L__unnamed_29(%rip), %rbx
	.p2align	4, 0x90
.LBB0_17:
	movl	i(%rip), %esi
	decl	%esi
	movl	%esi, i(%rip)
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$32, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	cmpl	$0, i(%rip)
	jg	.LBB0_17
.LBB0_18:
	leaq	.L__unnamed_30(%rip), %rdi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_31(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_32(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, i(%rip)
	testb	%bl, %bl
	jne	.LBB0_21
	leaq	.L__unnamed_33(%rip), %rbx
	.p2align	4, 0x90
.LBB0_20:
	movl	i(%rip), %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	incl	%eax
	movl	%eax, i(%rip)
	cmpl	$11, %eax
	jl	.LBB0_20
.LBB0_21:
	leaq	.L__unnamed_34(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	zero,@object
	.section	.rodata,"a",@progbits
	.p2align	2
zero:
	.long	0
	.size	zero, 4

	.type	one,@object
	.p2align	2
one:
	.long	1
	.size	one, 4

	.type	two,@object
	.p2align	2
two:
	.long	2
	.size	two, 4

	.type	x,@object
	.local	x
	.comm	x,4,4
	.type	y,@object
	.local	y
	.comm	y,4,4
	.type	i,@object
	.local	i
	.comm	i,4,4
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Please input two integers x and y"
	.size	.L__unnamed_1, 34

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
	.asciz	"%*[^\n]"
	.size	.L__unnamed_5, 7

	.type	.L__unnamed_6,@object
.L__unnamed_6:
	.asciz	"if test"
	.size	.L__unnamed_6, 8

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"\n"
	.size	.L__unnamed_7, 2

	.type	.L__unnamed_10,@object
.L__unnamed_10:
	.asciz	"x < y"
	.size	.L__unnamed_10, 6

	.type	.L__unnamed_11,@object
.L__unnamed_11:
	.asciz	"\n"
	.size	.L__unnamed_11, 2

	.type	.L__unnamed_12,@object
.L__unnamed_12:
	.asciz	"x > y"
	.size	.L__unnamed_12, 6

	.type	.L__unnamed_13,@object
.L__unnamed_13:
	.asciz	"\n"
	.size	.L__unnamed_13, 2

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"x = y"
	.size	.L__unnamed_8, 6

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"\n"
	.size	.L__unnamed_9, 2

	.type	.L__unnamed_14,@object
.L__unnamed_14:
	.asciz	"case test"
	.size	.L__unnamed_14, 10

	.type	.L__unnamed_15,@object
.L__unnamed_15:
	.asciz	"\n"
	.size	.L__unnamed_15, 2

	.type	.L__unnamed_16,@object
.L__unnamed_16:
	.asciz	"x mod 3 = "
	.size	.L__unnamed_16, 11

	.type	.L__unnamed_17,@object
.L__unnamed_17:
	.asciz	"%d"
	.size	.L__unnamed_17, 3

	.type	.L__unnamed_18,@object
.L__unnamed_18:
	.asciz	"\n"
	.size	.L__unnamed_18, 2

	.type	.L__unnamed_19,@object
.L__unnamed_19:
	.asciz	"repeat test"
	.size	.L__unnamed_19, 12

	.type	.L__unnamed_20,@object
.L__unnamed_20:
	.asciz	"\n"
	.size	.L__unnamed_20, 2

	.type	.L__unnamed_21,@object
.L__unnamed_21:
	.asciz	"%d"
	.size	.L__unnamed_21, 3

	.type	.L__unnamed_22,@object
.L__unnamed_22:
	.asciz	"%c"
	.size	.L__unnamed_22, 3

	.type	.L__unnamed_23,@object
.L__unnamed_23:
	.asciz	"%d"
	.size	.L__unnamed_23, 3

	.type	.L__unnamed_24,@object
.L__unnamed_24:
	.asciz	"%c"
	.size	.L__unnamed_24, 3

	.type	.L__unnamed_25,@object
.L__unnamed_25:
	.asciz	"\n"
	.size	.L__unnamed_25, 2

	.type	.L__unnamed_26,@object
.L__unnamed_26:
	.asciz	"while test"
	.size	.L__unnamed_26, 11

	.type	.L__unnamed_27,@object
.L__unnamed_27:
	.asciz	"\n"
	.size	.L__unnamed_27, 2

	.type	.L__unnamed_28,@object
.L__unnamed_28:
	.asciz	"%d"
	.size	.L__unnamed_28, 3

	.type	.L__unnamed_29,@object
.L__unnamed_29:
	.asciz	"%c"
	.size	.L__unnamed_29, 3

	.type	.L__unnamed_30,@object
.L__unnamed_30:
	.asciz	"\n"
	.size	.L__unnamed_30, 2

	.type	.L__unnamed_31,@object
.L__unnamed_31:
	.asciz	"for test"
	.size	.L__unnamed_31, 9

	.type	.L__unnamed_32,@object
.L__unnamed_32:
	.asciz	"\n"
	.size	.L__unnamed_32, 2

	.type	.L__unnamed_33,@object
.L__unnamed_33:
	.asciz	"%d"
	.size	.L__unnamed_33, 3

	.type	.L__unnamed_34,@object
.L__unnamed_34:
	.asciz	"\n"
	.size	.L__unnamed_34, 2


	.section	".note.GNU-stack","",@progbits
