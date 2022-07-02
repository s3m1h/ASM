
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    lea bx,metin
    mov si,0
    mov cx,7
    
    
    dongu:
        
        and [bx+si],11011111b 
        inc si
    loop dongu

 

ret

   metin db 'turkiye'


