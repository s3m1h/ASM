
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov cx,10
    mov bx,0

sonuc:
    dec cx; cx i bir azalt
    mov ax,cx; ax e cx i aktar
    mul cx; ax*cx carp, ax de karesi tutuluyor
    add bx,ax; ax+bx ve bxe aktar yani, bx = bx + ax
             
              
             
loop sonuc


end



