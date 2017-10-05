section .text
	global ft_bzero

ft_bzero:
	jmp main

main:
	cmp rsi, 0		; check if rsi(len) value is lower than 0
	jl return		; if so, return
	mov byte[rdi], 0	; move 0 to string[rdi]
	inc rdi			; inc string-pointer?
	dec rsi			; dec len(rsi)
	jmp main		; repeat

return:
	ret