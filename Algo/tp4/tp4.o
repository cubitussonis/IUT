	.file	"tp4.c"
	.text
	.globl	initialiser
	.type	initialiser, @function
initialiser:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	initialiser, .-initialiser
	.section	.rodata
	.align 8
.LC0:
	.string	"\n Nom: %s \n Categorie: %s \n Telephone: %s"
	.text
	.globl	afficherUnContact
	.type	afficherUnContact, @function
afficherUnContact:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	58(%rbp), %rdx
	leaq	37(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	afficherUnContact, .-afficherUnContact
	.section	.rodata
	.align 8
.LC1:
	.string	"Il n'y a pas de contacts dans le repertoire."
	.text
	.globl	afficherTous
	.type	afficherTous, @function
afficherTous:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L6
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L8
.L7:
	subq	$8, %rsp
	movq	-24(%rbp), %rax
	subq	$56, %rsp
	movq	%rsp, %rdx
	movq	(%rax), %rcx
	movq	8(%rax), %rbx
	movq	%rcx, (%rdx)
	movq	%rbx, 8(%rdx)
	movq	16(%rax), %rcx
	movq	24(%rax), %rbx
	movq	%rcx, 16(%rdx)
	movq	%rbx, 24(%rdx)
	movq	32(%rax), %rcx
	movq	40(%rax), %rbx
	movq	%rcx, 32(%rdx)
	movq	%rbx, 40(%rdx)
	movl	48(%rax), %ecx
	movl	%ecx, 48(%rdx)
	movzbl	52(%rax), %eax
	movb	%al, 52(%rdx)
	call	afficherUnContact
	addq	$64, %rsp
	movq	-24(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, -24(%rbp)
.L6:
	cmpq	$0, -24(%rbp)
	jne	.L7
.L8:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	afficherTous, .-afficherTous
	.globl	ajouterQueue
	.type	ajouterQueue, @function
ajouterQueue:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$64, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-8(%rbp), %rax
	leaq	21(%rax), %rdx
	leaq	37(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	movq	-8(%rbp), %rax
	leaq	42(%rax), %rdx
	leaq	58(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L14
.L13:
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, -8(%rbp)
.L12:
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L13
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 56(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
.L14:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	ajouterQueue, .-ajouterQueue
	.section	.rodata
.LC2:
	.string	"Le contact n'existe pas."
	.text
	.globl	rechercher
	.type	rechercher, @function
rechercher:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L18
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L17
.L21:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	movq	-8(%rbp), %rax
	jmp	.L20
.L19:
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, -8(%rbp)
.L18:
	cmpq	$0, -8(%rbp)
	jne	.L21
.L17:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	rechercher, .-rechercher
	.globl	supprimer
	.type	supprimer, @function
supprimer:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rechercher
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L23
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L24
.L25:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, -16(%rbp)
.L24:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jne	.L25
	cmpq	$0, -8(%rbp)
	jne	.L26
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	56(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L27
.L26:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	56(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 56(%rax)
.L27:
	movl	$1, %eax
	jmp	.L28
.L23:
	movl	$0, %eax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	supprimer, .-supprimer
	.section	.rodata
.LC3:
	.string	"\nSaisir le nom du contact : "
.LC4:
	.string	"%s"
	.align 8
.LC5:
	.string	"\nSaisir la categorie du contact : "
	.align 8
.LC6:
	.string	"\nSaisir le numero du contact : "
	.text
	.globl	ajouterContact
	.type	ajouterContact, @function
ajouterContact:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	addq	$21, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	addq	$42, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-72(%rbp), %rsi
	subq	$8, %rsp
	subq	$56, %rsp
	movq	%rsp, %rax
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rdx, (%rax)
	movq	%rcx, 8(%rax)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rdx, 16(%rax)
	movq	%rcx, 24(%rax)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rdx, 32(%rax)
	movq	%rcx, 40(%rax)
	movl	-16(%rbp), %edx
	movl	%edx, 48(%rax)
	movzbl	-12(%rbp), %edx
	movb	%dl, 52(%rax)
	movq	%rsi, %rdi
	call	ajouterQueue
	addq	$64, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	ajouterContact, .-ajouterContact
	.section	.rodata
.LC7:
	.string	"\nSaisir le nom du contact: "
	.align 8
.LC8:
	.string	"Categorie: %s, Numero de telephone: %s\n"
	.text
	.globl	chercherNumero
	.type	chercherNumero, @function
chercherNumero:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rechercher
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L32
	movq	-8(%rbp), %rax
	leaq	42(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	$21, %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L32:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	chercherNumero, .-chercherNumero
	.section	.rodata
	.align 8
.LC9:
	.string	"Saisir le nom du contact a modifier : "
	.align 8
.LC10:
	.string	"Saisir la nouvelle categorie du contact : "
	.align 8
.LC11:
	.string	"Saisir le nouveau numero de telephone du contact : "
	.text
	.globl	modifierContact
	.type	modifierContact, @function
modifierContact:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rechercher
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L35
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-8(%rbp), %rax
	leaq	21(%rax), %rdx
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	movq	-8(%rbp), %rax
	leaq	42(%rax), %rdx
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
.L35:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	modifierContact, .-modifierContact
	.section	.rodata
	.align 8
.LC12:
	.string	"\nSaisir le nom du contact a supprimer : "
	.text
	.globl	supprimerContact
	.type	supprimerContact, @function
supprimerContact:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	supprimer
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	supprimerContact, .-supprimerContact
	.section	.rodata
.LC13:
	.string	"\n    --- Menu --- "
	.align 8
.LC14:
	.string	"[1] - Afficher la liste des contacts du repertoire"
	.align 8
.LC15:
	.string	"[2] - Ajouter un contact au repertoire"
	.align 8
.LC16:
	.string	"[3] - Chercher le numero de telephone d'un contact"
	.align 8
.LC17:
	.string	"[4] - Modifier un contact du repertoire"
	.align 8
.LC18:
	.string	"[5] - Supprimer un contact du repertoire"
	.align 8
.LC19:
	.string	"[6] - Changer le repertoire courant"
.LC20:
	.string	"[0] - Quitter"
	.text
	.globl	afficherMenu
	.type	afficherMenu, @function
afficherMenu:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	afficherMenu, .-afficherMenu
	.section	.rodata
.LC21:
	.string	"%d"
.LC22:
	.string	"\nRepertoire %d :\n"
	.align 8
.LC23:
	.string	"\nSaisir le repertoire voulu (1, 2 ou 3) : "
	.align 8
.LC24:
	.string	"Ce repertoire n'existe pas, vous restez donc sur le repertoire actuel"
.LC25:
	.string	"Au revoir !"
	.align 8
.LC26:
	.string	"\nErreur, veuillez saisir 1, 2, 3, 4, 5, 6 ou 0 pour quitter."
	.text
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$-1, -4(%rbp)
	movl	$1, -8(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	initialiser
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	initialiser
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	initialiser
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	initialiser
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L39
.L53:
	movl	$0, %eax
	call	afficherMenu
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-4(%rbp), %eax
	cmpl	$6, %eax
	ja	.L40
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L42(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L42(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L42:
	.long	.L48-.L42
	.long	.L47-.L42
	.long	.L46-.L42
	.long	.L45-.L42
	.long	.L44-.L42
	.long	.L43-.L42
	.long	.L41-.L42
	.text
.L47:
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC22(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	afficherTous
	jmp	.L39
.L46:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	ajouterContact
	jmp	.L39
.L45:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	chercherNumero
	jmp	.L39
.L44:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	modifierContact
	jmp	.L39
.L43:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	supprimerContact
	jmp	.L39
.L41:
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-8(%rbp), %eax
	cmpl	$1, %eax
	jne	.L49
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L39
.L49:
	movl	-8(%rbp), %eax
	cmpl	$2, %eax
	jne	.L51
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L39
.L51:
	movl	-8(%rbp), %eax
	cmpl	$3, %eax
	jne	.L52
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L39
.L52:
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L39
.L48:
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L39
.L40:
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
.L39:
	movl	-4(%rbp), %eax
	testl	%eax, %eax
	jne	.L53
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
