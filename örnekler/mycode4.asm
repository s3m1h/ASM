
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


Harf macro p1
    
    mov dl,p1
    mov ah,2
    int 21h
    
endm          
Kelime macro p2
      
    lea dx, p2
    mov ah,2
    int 21h

endm
        

org 100h

    Harf 's'

    Kelime db "asaefsaef$"


ret




