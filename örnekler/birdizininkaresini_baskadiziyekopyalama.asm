
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
   
   lea bx,sayilar
   lea bp,kare
   
   mov di,0
   mov si,0
   mov cx,4
   
   devam:
       mov al,[bx+si]
       mul al
       mov [bp+di],al

       inc si
       add di,2
       dec cx
   jcxz son
        jmp devam
       
       
   son:

ret

   sayilar db 2,4,5,-3
   kare dw 4 dup(?)
end   


