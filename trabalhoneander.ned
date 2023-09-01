	;THAIS MARCELLE DIHL DA SILVA 
	 (A MOD X == 0)
	;Esse programa calcula o número de divisores de um número,
	;se ele tem apenas 2, é primo. 

	org 128
	A: Db 10
	resultado: db 
	divisor:DB 
	copia_A: DB
	copia_divisor: Db
	auxiliar: db
	um: db 1
	zero: db 0

	Org 00
	;inicio: atualizando as variaveis
	lda zero
	sta resultado
	sta divisor 
	lda um
	sta divisor
	lda A
	sta copia_A


	looping: ; parte principal do programa onde acontece a divisao 
	lda divisor
	not
	add um ;faz o complemento
	add copia_A ;ocorre a subtração aqui
	jz deuzero 
	jn nao_dividiu
	sta copia_A ; se não deu zero e nem negativo, salvamos o que sobrou e repete
	jmp looping ;o processo colocando um jump pro looping

	;se deu zero, é porque a divisão foi concluída, então 
	deuzero:
	lda resultado
	add um ;salvamos um no resultado 
	sta resultado ;guardamos
	lda divisor ;carregamos o divisor que no inicio era um 
	add um ;adicionamos mais um no divisor 
	sta divisor
	lda A ;carregamos A novamente para a cópia, pois ela é alterada sempre 
	sta copia_A
	jmp looping ;volta para o looping 

	;se a divisão ficou com resto 
	nao_dividiu: 
	lda divisor
	add um
	sta divisor
	sta auxiliar ;fizemos o teste salvando o divisor em uma nova auxiliar 
	not
	add um ;aplicamos o complemento e subtraímos A da auxiliar 
	add A
	Jn fim ;se deu negativo é porque o número divisor é maior que A 
	lda A
	sta copia_A ;salvamos o A novamente 
	jmp looping ; se não for, voltamos para o Looping 
	fim:
	hlt