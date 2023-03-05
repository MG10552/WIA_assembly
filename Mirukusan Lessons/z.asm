org 100h

mov dx, tekst1
mov ah, 0x0A	;funkcja w przerwaniu 21
int 0x21 		;przerwanie 21

mov cx, 30 		;licznik petli
petla:			;poczatek petli

	mov bp, 30
	sub bp, cx
	mov dx, [tekst1+bp]
	cmp dx, '$'			;porownuje aktualny znak ze znakiem konca (C++owy if)
	je zliczone				;jesli znajdzie znak konca oznacza to ze policzylismy juz ile znakow ma tekst
	
loop petla 		;koniec petli

zliczone:
mov ax, 30 
sub ax, cx 

;teraz w ax mamy nasze X

;wyswietlanie ax
mov dx, ax
mov ah, 2
int 0x21

mov dx, end
mov ah, 9
int 0x21

;przerwanie konczace
mov ax, 4c00h
int 21h

tekst1 db 30
end db 0Ah,0Dh, "$"