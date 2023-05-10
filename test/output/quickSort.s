	.text
	.file	"main"
	.globl	partion
	.p2align	4, 0x90
	.type	partion,@function
partion:
	.cfi_startproc
	movl	%edi, -4(%rsp)
	movl	%esi, -20(%rsp)
	decl	%esi
	movslq	%esi, %rax
	leaq	nums(%rip), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -12(%rsp)
	leal	-1(%rdi), %edx
	movl	%edx, -24(%rsp)
	movl	%edi, -28(%rsp)
	movslq	%edx, %rdx
	cmpl	%eax, (%rcx,%rdx,4)
	jge	.LBB0_2
.LBB0_1:
	movslq	-24(%rsp), %rax
	leal	1(%rax), %edx
	movl	%edx, -24(%rsp)
	movl	(%rcx,%rax,4), %edx
	movl	%edx, -16(%rsp)
	movl	-28(%rsp), %esi
	decl	%esi
	movslq	%esi, %rsi
	movl	(%rcx,%rsi,4), %edi
	movl	%edi, (%rcx,%rax,4)
	movl	%edx, (%rcx,%rsi,4)
.LBB0_2:
	movl	-28(%rsp), %eax
	incl	%eax
	movl	%eax, -28(%rsp)
	cmpl	-20(%rsp), %eax
	jge	.LBB0_4
	movl	-28(%rsp), %eax
	decl	%eax
	cltq
	movl	(%rcx,%rax,4), %eax
	cmpl	-12(%rsp), %eax
	jge	.LBB0_2
	jmp	.LBB0_1
.LBB0_4:
	movslq	-24(%rsp), %rdx
	leal	1(%rdx), %eax
	movl	(%rcx,%rdx,4), %r8d
	movl	%r8d, -16(%rsp)
	movl	-20(%rsp), %edi
	decl	%edi
	movslq	%edi, %rdi
	movl	(%rcx,%rdi,4), %esi
	movl	%esi, (%rcx,%rdx,4)
	movl	%r8d, (%rcx,%rdi,4)
	movl	%eax, -8(%rsp)
	retq
.Lfunc_end0:
	.size	partion, .Lfunc_end0-partion
	.cfi_endproc

	.globl	quicksort
	.p2align	4, 0x90
	.type	quicksort,@function
quicksort:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 16(%rsp)
	movl	%esi, 12(%rsp)
	cmpl	%esi, %edi
	jl	.LBB1_1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB1_1:
	.cfi_def_cfa_offset 32
	movl	16(%rsp), %edi
	movl	12(%rsp), %esi
	callq	partion@PLT
	movl	%eax, 20(%rsp)
	movl	16(%rsp), %edi
	leal	-1(%rax), %esi
	callq	quicksort@PLT
	movl	20(%rsp), %edi
	incl	%edi
	movl	12(%rsp), %esi
	callq	quicksort@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	quicksort, .Lfunc_end1-quicksort
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	.L__unnamed_1(%rip), %rdi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_2(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, i(%rip)
	testb	%bl, %bl
	jne	.LBB2_3
	leaq	.L__unnamed_3(%rip), %r14
	leaq	x(%rip), %r15
	leaq	.L__unnamed_4(%rip), %r12
	leaq	nums(%rip), %rbx
	.p2align	4, 0x90
.LBB2_2:
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	movq	%r12, %rdi
	xorl	%eax, %eax
	callq	scanf@PLT
	callq	getchar@PLT
	movl	i(%rip), %eax
	decl	%eax
	cltq
	movl	x(%rip), %ecx
	movl	%ecx, (%rbx,%rax,4)
	movl	i(%rip), %eax
	incl	%eax
	movl	%eax, i(%rip)
	cmpl	$11, %eax
	jl	.LBB2_2
.LBB2_3:
	leaq	.L__unnamed_5(%rip), %rdi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_6(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, i(%rip)
	testb	%bl, %bl
	jne	.LBB2_6
	leaq	nums(%rip), %r15
	leaq	.L__unnamed_7(%rip), %r14
	leaq	.L__unnamed_8(%rip), %rbx
	.p2align	4, 0x90
.LBB2_5:
	movl	i(%rip), %eax
	decl	%eax
	cltq
	movl	(%r15,%rax,4), %esi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	incl	%eax
	movl	%eax, i(%rip)
	cmpl	$11, %eax
	jl	.LBB2_5
.LBB2_6:
	leaq	.L__unnamed_9(%rip), %rdi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_10(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %edi
	movl	$10, %esi
	callq	quicksort@PLT
	leaq	.L__unnamed_11(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.L__unnamed_12(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, i(%rip)
	testb	%bl, %bl
	jne	.LBB2_9
	leaq	nums(%rip), %r15
	leaq	.L__unnamed_13(%rip), %r14
	leaq	.L__unnamed_14(%rip), %rbx
	.p2align	4, 0x90
.LBB2_8:
	movl	i(%rip), %eax
	decl	%eax
	cltq
	movl	(%r15,%rax,4), %esi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	incl	%eax
	movl	%eax, i(%rip)
	cmpl	$11, %eax
	jl	.LBB2_8
.LBB2_9:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	nums,@object
	.local	nums
	.comm	nums,40,16
	.type	i,@object
	.local	i
	.comm	i,4,4
	.type	x,@object
	.local	x
	.comm	x,4,4
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Please enter 10 integers, press Enter after each number:"
	.size	.L__unnamed_1, 57

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
	.asciz	"%*[^\n]"
	.size	.L__unnamed_4, 7

	.type	.L__unnamed_5,@object
.L__unnamed_5:
	.asciz	"The numbers you entered are:"
	.size	.L__unnamed_5, 29

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

	.type	.L__unnamed_9,@object
.L__unnamed_9:
	.asciz	"Start to sort"
	.size	.L__unnamed_9, 14

	.type	.L__unnamed_10,@object
.L__unnamed_10:
	.asciz	"\n"
	.size	.L__unnamed_10, 2

	.type	.L__unnamed_11,@object
.L__unnamed_11:
	.asciz	"The sorted numbers are:"
	.size	.L__unnamed_11, 24

	.type	.L__unnamed_12,@object
.L__unnamed_12:
	.asciz	"\n"
	.size	.L__unnamed_12, 2

	.type	.L__unnamed_13,@object
.L__unnamed_13:
	.asciz	"%d"
	.size	.L__unnamed_13, 3

	.type	.L__unnamed_14,@object
.L__unnamed_14:
	.asciz	"\n"
	.size	.L__unnamed_14, 2


	.section	".note.GNU-stack","",@progbits
