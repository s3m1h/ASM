
org 100h

lea bx, sayilar
lea bp, sayilar2


mov si,0 ; si yi once bir sifirliyoruz
mov cx,5 ;cx e dongunun kac defa donecegini belirtmemiz gerekiyor

atla:
    mov al,[bx+si];burada sirayla bx+0 bx+1 ...vs
    mov [bp+si],al

    ;si yi bir arttiriyoruz 
    inc si; inc bir arttirma islemi yapar

loop atla
; cx = 0 oldugunda buraya gelir

ret

    sayilar db 10,8,7,9,4
    sayilar2 db 5 dup(?)
end


