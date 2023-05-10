	.text
	.file	"main"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$1, i(%rip)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_3
	leaq	n(%rip), %rax
	.p2align	4, 0x90
.LBB0_2:
	movl	i(%rip), %ecx
	leal	-1(%rcx), %edx
	movslq	%edx, %rdx
	addl	$100, %ecx
	movl	%ecx, (%rax,%rdx,4)
	movl	i(%rip), %ecx
	incl	%ecx
	movl	%ecx, i(%rip)
	cmpl	$11, %ecx
	jl	.LBB0_2
.LBB0_3:
	movl	$1, j(%rip)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_6
	leaq	.L__unnamed_1(%rip), %r14
	leaq	.L__unnamed_2(%rip), %r15
	leaq	.L__unnamed_3(%rip), %r12
	leaq	n(%rip), %rbp
	leaq	.L__unnamed_4(%rip), %r13
	leaq	.L__unnamed_5(%rip), %rbx
	.p2align	4, 0x90
.LBB0_5:
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	j(%rip), %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%r12, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	j(%rip), %eax
	decl	%eax
	cltq
	movl	(%rbp,%rax,4), %esi
	movq	%r13, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	j(%rip), %eax
	incl	%eax
	movl	%eax, j(%rip)
	cmpl	$11, %eax
	jl	.LBB0_5
.LBB0_6:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	n,@object
	.local	n
	.comm	n,40,16
	.type	nums,@object
	.local	nums
	.comm	nums,40,16
	.type	i,@object
	.local	i
	.comm	i,4,4
	.type	j,@object
	.local	j
	.comm	j,4,4
	.type	.L__unnamed_1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Element["
	.size	.L__unnamed_1, 9

	.type	.L__unnamed_2,@object
.L__unnamed_2:
	.asciz	"%d"
	.size	.L__unnamed_2, 3

	.type	.L__unnamed_3,@object
.L__unnamed_3:
	.asciz	"] = "
	.size	.L__unnamed_3, 5

	.type	.L__unnamed_4,@object
.L__unnamed_4:
	.asciz	"%d"
	.size	.L__unnamed_4, 3

	.type	.L__unnamed_5,@object
.L__unnamed_5:
	.asciz	"\n"
	.size	.L__unnamed_5, 2


	.section	".note.GNU-stack","",@progbits
