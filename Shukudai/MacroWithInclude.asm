org 	100h
;=====[Wywołujemy zawarcie]======
%include "MacroWithTxt.asm"
;===[korzystamy z funkcji z'include'owanego programu]===
display l1         
;===[korzystamy z funkcji z'include'owanego programu]===
finish
;==[I oto nasz text!]==
l1 db "I ",3h," Assembler! ",1h," ",2h," ",6h,"$"