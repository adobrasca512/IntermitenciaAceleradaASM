ser r16
out ddrd,r16



main: 

reestablecer:
ldi r17,100; 100 veces un ms es un s
rep:
ldi r16,0b00000000; prender leds
encender: ;mientras no este todo encendido ejecutamos delay

out portd,r16

push r17
call delay1ms
pop r17
dec r17; bajamos los 100
cpi r17,0; verificamos que no sea 0 aun
breq reestablecer
;ldi r17,100; 100 veces un ms es un s
;rjmp encender
;aqui setear
continuar:
lsr r16
ori r16,0b10000000
cpi r16,0b11111111

brne encender
;sacamos los leds encedidos todos
out portd,r16

push r17
call delay1ms
pop r17


rjmp rep
ret 

  delay1ms:

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
