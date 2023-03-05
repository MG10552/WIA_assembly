org 	100h
;=====[Macro dla textu]======
%macro display 1 
	mov dx, %1    
	mov ah, 9         
	int 21h  
%endmacro
;=====[Macro dla zakończenia programu]=====
%macro finish 0 
	mov ax, 0x4C00     
	int 21h  
%endmacro
;===[Wywołujemy text]===
display l1         
;===[Wywołujemy zakończenie programu]===
finish
;==[No i pojawia się text]==
l1 db "I ",3h," Assembler! ",1h," ",2h," ",6h,"$" 