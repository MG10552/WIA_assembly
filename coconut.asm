org 100h

mov dx, tekst1
mov ah, 0x0A	;funkcja w przerwaniu 21
int 0x21 		;przerwanie 21

mov cx, 30 
