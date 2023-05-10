	.text
	.file	"main"
	.globl	mod3value
	.p2align	4, 0x90
	.type	mod3value,@function
mod3value:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	movslq	%edi, %rax
	imulq	$1431655766, %rax, %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%ecx, %eax
	je	.LBB0_4
	cmpl	$1, %eax
	je	.LBB0_5
	cmpl	$2, %eax
	jne	.LBB0_7
	leaq	.L__unnamed_1(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_2(%rip), %rdi
	jmp	.LBB0_6
.LBB0_4:
	leaq	.L__unnamed_3(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_4(%rip), %rdi
	jmp	.LBB0_6
.LBB0_5:
	leaq	.L__unnamed_5(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
.LBB0_6:
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_7:
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	mod3value, .Lfunc_end0-mod3value
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$100, i(%rip)
	leaq	.L__unnamed_7(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_8(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	pi(%rip), %xmm0
	leaq	.L__unnamed_9(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.L__unnamed_10(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_11(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_12(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_13(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$7, %edi
	callq	mod3value@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	pi,@object
	.section	.rodata,"a",@progbits
	.p2align	3
pi:
	.quad	4614256650576692846
	.size	pi, 8

	.type	i,@object
	.local	i
	.comm	i,4,4
	.type	.L__unnamed_3,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_3:
	.asciz	"Red"
	.size	.L__unnamed_3, 4

	.type	.L__unnamed_4,@object
.L__unnamed_4:
	.asciz	"\n"
	.size	.L__unnamed_4, 2

	.type	.L__unnamed_5,@object
.L__unnamed_5:
	.asciz	"Green"
	.size	.L__unnamed_5, 6

	.type	.L__unnamed_6,@object
.L__unnamed_6:
	.asciz	"\n"
	.size	.L__unnamed_6, 2

	.type	.L__unnamed_1,@object
.L__unnamed_1:
	.asciz	"Blue"
	.size	.L__unnamed_1, 5

	.type	.L__unnamed_2,@object
.L__unnamed_2:
	.asciz	"\n"
	.size	.L__unnamed_2, 2

	.type	.L__unnamed_7,@object
.L__unnamed_7:
	.asciz	"const test"
	.size	.L__unnamed_7, 11

	.type	.L__unnamed_8,@object
.L__unnamed_8:
	.asciz	"\n"
	.size	.L__unnamed_8, 2

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"%lf"
	.size	.L__unnamed_9, 4

	.type	.L__unnamed_10,@object
.L__unnamed_10:
	.asciz	"\n"
	.size	.L__unnamed_10, 2

	.type	.L__unnamed_11,@object
.L__unnamed_11:
	.asciz	"test type and routine"
	.size	.L__unnamed_11, 22

	.type	.L__unnamed_12,@object
.L__unnamed_12:
	.asciz	"\n"
	.size	.L__unnamed_12, 2

	.type	.L__unnamed_13,@object
.L__unnamed_13:
	.asciz	"7 mod 3 is: "
	.size	.L__unnamed_13, 13


	.section	".note.GNU-stack","",@progbits
