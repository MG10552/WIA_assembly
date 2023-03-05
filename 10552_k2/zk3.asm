org	100h
mov ah, 0ah
mov dx, 80*2
mov ds, 0b800h
mov ax, 0b800h
mov es, ax

mov [es:(20*80+75)*2], 06401h

mov ds, bx
int 21h
mov ax, 0x4C00
int 0x21

tekst db "Podaj liczbe: $"
nowalinia db 0Ah, 0Dh, "$"
bufor db 20,0
db "$$$$$$$$$$"
