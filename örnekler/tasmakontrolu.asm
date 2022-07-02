
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al,2
add al,255
jc tasmaoldu; CF bayragi 1 ise

tasmaoldu:
    mov [tasma],10h


ret

    tasma db 0


