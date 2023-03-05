org 100h

mov dx, tekst1
mov ah, 0x0A	;funkcja w przerwaniu 21
int 0x21 		;przerwanie 21

mov cx, 30 		;licznik petli
mov bp, 0
petla:			;poczatek petli

	mov dx, [tekst1+bp]
	cmp dx, 0Dh			;porownuje aktualny znak ze znakiem konca (C++owy if)
	je zliczone				;jesli znajdzie znak konca oznacza to ze policzylismy juz ile znakow ma tekst
	add bp,1
	
loop petla 		;koniec petli

zliczone:
mov ax, 30 
sub ax, cx 
;teraz w ax mamy nasze X

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

tekst1 db 30
end db 0Ah,0Dh, "$"
tak db "tak$"
nie db "nie$"