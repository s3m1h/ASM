
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


lea bx,dizi1
lea bp,dizi2

mov si,0
mov cx,4

loopetiketi:
    mov al,[bx+si]
    mov [bp+si],al 
    inc si; unutma bir arttirmak lazim
loop loopetiketi           


ret 

    dizi1 db 10,3,4,5
    dizi2 db 4 dup(?) 

end 


