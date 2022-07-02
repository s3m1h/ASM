
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov al,2
    mov ah,2
    
    cmp al,ah
    JL kucuk
    JG buyuk
    JE esittir
    
    kucuk:
        mov bx,12h
    buyuk:
        mov bx,10h
        
    esittir:
        mov bx,17h
ret




