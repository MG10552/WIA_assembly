org 	100h ;You have started! Changing VGA: Very Giant Armchair
			 ;12h = 640x480 + 16colors
mov ax,12h  
int 10h 	;przerywamy VidBIOS'owi

;===[Macro wielkiego wybuchu]===
%macro tnt 1
mov dx, %1
mov ah, 9 
int 21h 	
%endmacro

mov ah, 0
int 16h 	;czekamy, az nasz user cos sobie nacisnie

mov ax, 3 	;fajnie bylo ale, musimy juz wrocic do rzeczywistosci ,czyli trybu txt 80x25 cm w 16 kolorkach 
int 10h 	;kolejny raz przerywamy VidBIOS'owi, teraz to sie na pewno wkurzy

;===[macro wypuszczenia rakiet]===
%macro execute 0 
	mov ax, 0x4C00     
	int 21h  
%endmacro

;===[Wołamy o makra]===
tnt l1
execute

;===[Informujemy użytkownika, ze wlasnie zniszczyl swiat, chyba powiniem wiedziec... chyba...]===
l1 db "Wcisnij sobie co chcesz aby, wypuscic rakiety, ktore zniszcza Ziemie. Buahahaha-ha!!!", "$"
