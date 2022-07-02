
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
    
    lea bx,sayilar
    mov si,0
    mov cx,4
    
    dongu:
    inc [bx+si]
    inc si 
    dec cx
    jcxz son
      jmp dongu               
      

    son:
   
ret
   
   sayilar db 2,5,4,6
   
   
end



