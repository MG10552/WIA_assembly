org 100h

;===[Chcemy tryb graficzny]===
mov ax, 13h
int 10h

mov ax, 0xA000
mov es, ax

;===[zerujemy]===
x: db 0,0
y: db 0,0
color: db 0,0
range_x: db 0,0
range_y: db 0,0

drop:
;===[wrzucamy beleczki na stos]===
push ax 
push bx
push di

mov ax,[y]
add ax, [range_y]
mul bx,320
add ax,[x]
add ax, [range_x]
;===[dodajemy przeliczony offset do 'di']===
mov di,ax  
;===[przesylamy pomalowany bit do 'al']===      
mov ax,[color] 
;===[pomalowana czesc zabieramy na ekran]===
mov [es:di],al  
;===[zdejmujemy belki, bo chcemy rozpalic ognisko]===
pop di 
pop bx
pop ax
ret 
;===[zmiana początku swiata, na niebiesko]===
mov byte [range_y], 156 
mov byte [range_x], 98
mov byte [color], 1

;===[Linia 1]===
mov [y], 0
;=[Zrzucamy bomby]=
mov [x], 1
call drop
mov byte [x], 2
call drop 
mov byte [x], 7
call drop 
mov byte [x], 8
call drop

;===[Linia 2]===
mov byte [y], 1
;=[Zrzucamy bomby]=
mov byte [x], 0
call drop
mov byte [x], 3
call drop
mov byte [x], 6
call drop
mov byte [x], 9
call drop
;<<<<<<<=========[omijamy jedna linie zeby bylo ladnie^^]
;===[Linia 3]===
mov byte [y], 3 
;=[Zrzucamy bomby]=
mov byte [x], 2
call drop 
mov byte [x], 7
call drop

;===[Linia 4]===
mov byte [y], 4
;=[Zrzucamy bomby]=
mov byte [x], 3
call drop
mov byte [x], 4
call drop
mov byte [x], 5
call drop
mov byte [x], 6
call drop
;===[czekamy az ambicja usera osiagnie apogeum i cos wcisnie]===
mov ah,0 ;wez
int 16h  ;czekaj

;===[koniec zabawy, wracamy do trybu txt]===
mov ax, 3h
int 10h
;===[koniec tego dobrego, kurtyna w dol]===
move ax, 0x4C00
int 21h
