ser r16
out ddrd,r16
ldi r17,100; 100 veces un ms es un s


main: 

ldi r16,0b10000000

repetir:
out portd,r16

push r17
call funcion
pop r17

dec r17
cpi r17,0
breq setear
lsr r16
ori r16,0b10000000
cpi r16,0b11111111
brne repetir
;ldi r18,0b00000000
out portd,r16

push r17

call funcion
pop r17



rjmp main

  funcion:

  	PUSH YH
	PUSH YL
    IN YH, SPH
	IN YL, SPL
	PUSH r0
    push r18
	push r19
	
	ldd r0,Y+5; ret,ret,yh,yl,r17
	
	
	buclefor:
	
    ldi  r18, 208
    ldi  r19, 202
L1: dec  r19
    brne L1
    dec  r18
    brne L1
	dec r0
	brne buclefor
	pop  r19
	pop r18
	pop r0
	pop YL
	pop YH
	ret	
	; aqui seteo el valor de r17
	setear:
	ldi r17,100
	rcall main