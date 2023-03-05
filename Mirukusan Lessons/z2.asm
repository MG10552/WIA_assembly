org 100h

mov ax,4		;nasz X

; ((x+4)*2)/4
mov cx, 4	
add ax,cx	; dodajemy 4 do X
;mnoĹźenie wykonywane jest na ax i wynik nadal pozostaje w ax
mov cx, 2
mul cx	; dx,ax = ax * CX

;dzielenie uzywa dodatkowo rejestru dx wiec musimy go wyzerowac
mov dx, 0
mov cx, 4
div cx	; ax/cx = ax reszta dx
;wynik jest w ax

mov dx, 0
mov cx, 2
div cx	; ax/cx = ax reszta dx

;dx = 0/1
cmp dx, 0 ; if(dx==0)
je prawda
	mov dx, nie
	mov ah, 9
	int 0x21
jmp koniec
prawda:
	mov dx, tak
	mov ah, 9
	int 0x21

koniec:
;przerwanie konczace
mov ax, 4c00h
int 21h

tak db "tak$"
nie db "nie$"