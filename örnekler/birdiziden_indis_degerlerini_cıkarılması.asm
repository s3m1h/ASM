
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
    lea bx,sayilar
    lea si,fark
    
 
    mov cx,4
    mov al,0
    dongu:
        
        mov ah,[bx]
        sub ah,al
        mov [si],ah
        
        inc al
        inc si
        inc bx
        
        
    loop dongu
   
    

ret

    sayilar db 7,6,5,4
    fark db 4 dup(?)

end