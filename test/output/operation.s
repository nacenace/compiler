	.text
	.file	"main"
	.globl	sum
	.p2align	4, 0x90
	.type	sum,@function
sum:
	.cfi_startproc
	movl	%edi, %eax
	movl	%edi, -4(%rsp)
	movl	%esi, -8(%rsp)
	addl	%esi, %eax
	movl	%eax, -12(%rsp)
	retq
.Lfunc_end0:
	.size	sum, .Lfunc_end0-sum
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_0:
	.quad	0
	.text
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
	leaq	a(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	leaq	b(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_5(%rip), %rdi
	xorl	%eax, %eax
	callq	scanf@PLT
	callq	getchar@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%esi, %esi
	subl	a(%rip), %esi
	leaq	.L__unnamed_7(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%esi, %esi
	subl	b(%rip), %esi
	leaq	.L__unnamed_9(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_10(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_11(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %esi
	addl	b(%rip), %esi
	leaq	.L__unnamed_12(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_13(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_14(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %esi
	subl	b(%rip), %esi
	leaq	.L__unnamed_15(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_16(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_17(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %esi
	imull	b(%rip), %esi
	leaq	.L__unnamed_18(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_19(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_20(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	cvtsi2sdl	a(%rip), %xmm0
	cvtsi2sdl	b(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	.L__unnamed_21(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_22(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_23(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %eax
	cltd
	idivl	b(%rip)
	leaq	.L__unnamed_24(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_25(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_26(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %eax
	cltd
	idivl	b(%rip)
	leaq	.L__unnamed_27(%rip), %rdi
	movl	%edx, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_28(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_29(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %esi
	xorl	b(%rip), %esi
	leaq	.L__unnamed_30(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_31(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_32(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	callq	fabs@PLT
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.LBB1_2
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB1_3
.LBB1_2:
	callq	sqrt@PLT
.LBB1_3:
	leaq	.L__unnamed_33(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_34(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_35(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_36(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_37(%rip), %rdi
	leaq	c(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_38(%rip), %rdi
	leaq	d(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_39(%rip), %rdi
	xorl	%eax, %eax
	callq	scanf@PLT
	callq	getchar@PLT
	leaq	.L__unnamed_40(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	c(%rip), %xmm0
	addsd	d(%rip), %xmm0
	leaq	.L__unnamed_41(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_42(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_43(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	c(%rip), %xmm0
	subsd	d(%rip), %xmm0
	leaq	.L__unnamed_44(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_45(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_46(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	c(%rip), %xmm0
	mulsd	d(%rip), %xmm0
	leaq	.L__unnamed_47(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_48(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_49(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	c(%rip), %xmm0
	divsd	d(%rip), %xmm0
	leaq	.L__unnamed_50(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_51(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_52(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	c(%rip), %xmm0
	callq	fabs@PLT
	ucomisd	.LCPI1_0(%rip), %xmm0
	jb	.LBB1_5
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB1_6
.LBB1_5:
	callq	sqrt@PLT
.LBB1_6:
	leaq	.L__unnamed_53(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_54(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_55(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorps	%xmm0, %xmm0
	cvtsi2sdl	a(%rip), %xmm0
	addsd	c(%rip), %xmm0
	leaq	.L__unnamed_56(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_57(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_58(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorps	%xmm0, %xmm0
	cvtsi2sdl	b(%rip), %xmm0
	mulsd	d(%rip), %xmm0
	leaq	.L__unnamed_59(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_60(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movb	$0, e(%rip)
	leaq	.L__unnamed_61(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movzbl	e(%rip), %esi
	leaq	.L__unnamed_62(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_63(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movb	$1, e(%rip)
	leaq	.L__unnamed_64(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movzbl	e(%rip), %esi
	leaq	.L__unnamed_65(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_66(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movb	$0, e(%rip)
	leaq	.L__unnamed_67(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movzbl	e(%rip), %esi
	leaq	.L__unnamed_68(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_69(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	a(%rip), %eax
	cmpl	b(%rip), %eax
	setg	e(%rip)
	leaq	.L__unnamed_70(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movzbl	e(%rip), %esi
	leaq	.L__unnamed_71(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_72(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_73(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_74(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_75(%rip), %rdi
	leaq	ch(%rip), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	leaq	.L__unnamed_76(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movzbl	ch(%rip), %esi
	leaq	.L__unnamed_77(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_78(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_79(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movb	ch(%rip), %al
	decb	%al
	movzbl	%al, %esi
	leaq	.L__unnamed_80(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_81(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_82(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movb	ch(%rip), %al
	incb	%al
	movzbl	%al, %esi
	leaq	.L__unnamed_83(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_84(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	a,@object
	.local	a
	.comm	a,4,4
	.type	b,@object
	.local	b
	.comm	b,4,4
	.type	c,@object
	.local	c
	.comm	c,8,8
	.type	d,@object
	.local	d
	.comm	d,8,8
	.type	ch,@object
	.local	ch
	.comm	ch,1,1
	.type	e,@object
	.local	e
	.comm	e,1,1
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
	.asciz	"-a = "
	.size	.L__unnamed_6, 6

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"%d"
	.size	.L__unnamed_7, 3

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	", -b = "
	.size	.L__unnamed_8, 8

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"%d"
	.size	.L__unnamed_9, 3

	.type	.L__unnamed_10,@object
.L__unnamed_10:
	.asciz	"\n"
	.size	.L__unnamed_10, 2

	.type	.L__unnamed_11,@object
.L__unnamed_11:
	.asciz	"a  +  b = "
	.size	.L__unnamed_11, 11

	.type	.L__unnamed_12,@object
.L__unnamed_12:
	.asciz	"%d"
	.size	.L__unnamed_12, 3

	.type	.L__unnamed_13,@object
.L__unnamed_13:
	.asciz	"\n"
	.size	.L__unnamed_13, 2

	.type	.L__unnamed_14,@object
.L__unnamed_14:
	.asciz	"a  -  b = "
	.size	.L__unnamed_14, 11

	.type	.L__unnamed_15,@object
.L__unnamed_15:
	.asciz	"%d"
	.size	.L__unnamed_15, 3

	.type	.L__unnamed_16,@object
.L__unnamed_16:
	.asciz	"\n"
	.size	.L__unnamed_16, 2

	.type	.L__unnamed_17,@object
.L__unnamed_17:
	.asciz	"a  *  b = "
	.size	.L__unnamed_17, 11

	.type	.L__unnamed_18,@object
.L__unnamed_18:
	.asciz	"%d"
	.size	.L__unnamed_18, 3

	.type	.L__unnamed_19,@object
.L__unnamed_19:
	.asciz	"\n"
	.size	.L__unnamed_19, 2

	.type	.L__unnamed_20,@object
.L__unnamed_20:
	.asciz	"a  /  b = "
	.size	.L__unnamed_20, 11

	.type	.L__unnamed_21,@object
.L__unnamed_21:
	.asciz	"%lf"
	.size	.L__unnamed_21, 4

	.type	.L__unnamed_22,@object
.L__unnamed_22:
	.asciz	"\n"
	.size	.L__unnamed_22, 2

	.type	.L__unnamed_23,@object
.L__unnamed_23:
	.asciz	"a div b = "
	.size	.L__unnamed_23, 11

	.type	.L__unnamed_24,@object
.L__unnamed_24:
	.asciz	"%d"
	.size	.L__unnamed_24, 3

	.type	.L__unnamed_25,@object
.L__unnamed_25:
	.asciz	"\n"
	.size	.L__unnamed_25, 2

	.type	.L__unnamed_26,@object
.L__unnamed_26:
	.asciz	"a mod b = "
	.size	.L__unnamed_26, 11

	.type	.L__unnamed_27,@object
.L__unnamed_27:
	.asciz	"%d"
	.size	.L__unnamed_27, 3

	.type	.L__unnamed_28,@object
.L__unnamed_28:
	.asciz	"\n"
	.size	.L__unnamed_28, 2

	.type	.L__unnamed_29,@object
.L__unnamed_29:
	.asciz	"a xor b = "
	.size	.L__unnamed_29, 11

	.type	.L__unnamed_30,@object
.L__unnamed_30:
	.asciz	"%d"
	.size	.L__unnamed_30, 3

	.type	.L__unnamed_31,@object
.L__unnamed_31:
	.asciz	"\n"
	.size	.L__unnamed_31, 2

	.type	.L__unnamed_32,@object
.L__unnamed_32:
	.asciz	"sqrt(abs(a)) = "
	.size	.L__unnamed_32, 16

	.type	.L__unnamed_33,@object
.L__unnamed_33:
	.asciz	"%lf"
	.size	.L__unnamed_33, 4

	.type	.L__unnamed_34,@object
.L__unnamed_34:
	.asciz	"\n"
	.size	.L__unnamed_34, 2

	.type	.L__unnamed_35,@object
.L__unnamed_35:
	.asciz	"Please input two floats c and d"
	.size	.L__unnamed_35, 32

	.type	.L__unnamed_36,@object
.L__unnamed_36:
	.asciz	"\n"
	.size	.L__unnamed_36, 2

	.type	.L__unnamed_37,@object
.L__unnamed_37:
	.asciz	"%lf"
	.size	.L__unnamed_37, 4

	.type	.L__unnamed_38,@object
.L__unnamed_38:
	.asciz	"%lf"
	.size	.L__unnamed_38, 4

	.type	.L__unnamed_39,@object
.L__unnamed_39:
	.asciz	"%*[^\n]"
	.size	.L__unnamed_39, 7

	.type	.L__unnamed_40,@object
.L__unnamed_40:
	.asciz	"c + d = "
	.size	.L__unnamed_40, 9

	.type	.L__unnamed_41,@object
.L__unnamed_41:
	.asciz	"%lf"
	.size	.L__unnamed_41, 4

	.type	.L__unnamed_42,@object
.L__unnamed_42:
	.asciz	"\n"
	.size	.L__unnamed_42, 2

	.type	.L__unnamed_43,@object
.L__unnamed_43:
	.asciz	"c - d = "
	.size	.L__unnamed_43, 9

	.type	.L__unnamed_44,@object
.L__unnamed_44:
	.asciz	"%lf"
	.size	.L__unnamed_44, 4

	.type	.L__unnamed_45,@object
.L__unnamed_45:
	.asciz	"\n"
	.size	.L__unnamed_45, 2

	.type	.L__unnamed_46,@object
.L__unnamed_46:
	.asciz	"c * d = "
	.size	.L__unnamed_46, 9

	.type	.L__unnamed_47,@object
.L__unnamed_47:
	.asciz	"%lf"
	.size	.L__unnamed_47, 4

	.type	.L__unnamed_48,@object
.L__unnamed_48:
	.asciz	"\n"
	.size	.L__unnamed_48, 2

	.type	.L__unnamed_49,@object
.L__unnamed_49:
	.asciz	"c / d = "
	.size	.L__unnamed_49, 9

	.type	.L__unnamed_50,@object
.L__unnamed_50:
	.asciz	"%lf"
	.size	.L__unnamed_50, 4

	.type	.L__unnamed_51,@object
.L__unnamed_51:
	.asciz	"\n"
	.size	.L__unnamed_51, 2

	.type	.L__unnamed_52,@object
.L__unnamed_52:
	.asciz	"sqrt(abs(c)) = "
	.size	.L__unnamed_52, 16

	.type	.L__unnamed_53,@object
.L__unnamed_53:
	.asciz	"%lf"
	.size	.L__unnamed_53, 4

	.type	.L__unnamed_54,@object
.L__unnamed_54:
	.asciz	"\n"
	.size	.L__unnamed_54, 2

	.type	.L__unnamed_55,@object
.L__unnamed_55:
	.asciz	"a + c = "
	.size	.L__unnamed_55, 9

	.type	.L__unnamed_56,@object
.L__unnamed_56:
	.asciz	"%lf"
	.size	.L__unnamed_56, 4

	.type	.L__unnamed_57,@object
.L__unnamed_57:
	.asciz	"\n"
	.size	.L__unnamed_57, 2

	.type	.L__unnamed_58,@object
.L__unnamed_58:
	.asciz	"b * d = "
	.size	.L__unnamed_58, 9

	.type	.L__unnamed_59,@object
.L__unnamed_59:
	.asciz	"%lf"
	.size	.L__unnamed_59, 4

	.type	.L__unnamed_60,@object
.L__unnamed_60:
	.asciz	"\n"
	.size	.L__unnamed_60, 2

	.type	.L__unnamed_61,@object
.L__unnamed_61:
	.asciz	"true and false: "
	.size	.L__unnamed_61, 17

	.type	.L__unnamed_62,@object
.L__unnamed_62:
	.asciz	"%d"
	.size	.L__unnamed_62, 3

	.type	.L__unnamed_63,@object
.L__unnamed_63:
	.asciz	"\n"
	.size	.L__unnamed_63, 2

	.type	.L__unnamed_64,@object
.L__unnamed_64:
	.asciz	"true or false: "
	.size	.L__unnamed_64, 16

	.type	.L__unnamed_65,@object
.L__unnamed_65:
	.asciz	"%d"
	.size	.L__unnamed_65, 3

	.type	.L__unnamed_66,@object
.L__unnamed_66:
	.asciz	"\n"
	.size	.L__unnamed_66, 2

	.type	.L__unnamed_67,@object
.L__unnamed_67:
	.asciz	"not true: "
	.size	.L__unnamed_67, 11

	.type	.L__unnamed_68,@object
.L__unnamed_68:
	.asciz	"%d"
	.size	.L__unnamed_68, 3

	.type	.L__unnamed_69,@object
.L__unnamed_69:
	.asciz	"\n"
	.size	.L__unnamed_69, 2

	.type	.L__unnamed_70,@object
.L__unnamed_70:
	.asciz	"a > b: "
	.size	.L__unnamed_70, 8

	.type	.L__unnamed_71,@object
.L__unnamed_71:
	.asciz	"%d"
	.size	.L__unnamed_71, 3

	.type	.L__unnamed_72,@object
.L__unnamed_72:
	.asciz	"\n"
	.size	.L__unnamed_72, 2

	.type	.L__unnamed_73,@object
.L__unnamed_73:
	.asciz	"Please input one character ch"
	.size	.L__unnamed_73, 30

	.type	.L__unnamed_74,@object
.L__unnamed_74:
	.asciz	"\n"
	.size	.L__unnamed_74, 2

	.type	.L__unnamed_75,@object
.L__unnamed_75:
	.asciz	"%c"
	.size	.L__unnamed_75, 3

	.type	.L__unnamed_76,@object
.L__unnamed_76:
	.asciz	"chr(ord(ch))  = "
	.size	.L__unnamed_76, 17

	.type	.L__unnamed_77,@object
.L__unnamed_77:
	.asciz	"%c"
	.size	.L__unnamed_77, 3

	.type	.L__unnamed_78,@object
.L__unnamed_78:
	.asciz	"\n"
	.size	.L__unnamed_78, 2

	.type	.L__unnamed_79,@object
.L__unnamed_79:
	.asciz	"pred(ch) = "
	.size	.L__unnamed_79, 12

	.type	.L__unnamed_80,@object
.L__unnamed_80:
	.asciz	"%c"
	.size	.L__unnamed_80, 3

	.type	.L__unnamed_81,@object
.L__unnamed_81:
	.asciz	"\n"
	.size	.L__unnamed_81, 2

	.type	.L__unnamed_82,@object
.L__unnamed_82:
	.asciz	"succ(ch) = "
	.size	.L__unnamed_82, 12

	.type	.L__unnamed_83,@object
.L__unnamed_83:
	.asciz	"%c"
	.size	.L__unnamed_83, 3

	.type	.L__unnamed_84,@object
.L__unnamed_84:
	.asciz	"\n"
	.size	.L__unnamed_84, 2


	.section	".note.GNU-stack","",@progbits
