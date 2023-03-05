org     100h      
mov dx, tekst      
mov ah, 9           
int 0x21          
mov ax, 0x4C00     
int 0x21
       
tekst db "M",0Ah,0Dh,"$"  
