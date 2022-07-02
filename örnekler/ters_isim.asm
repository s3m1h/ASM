
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

lea bx,isim
lea bp,tersisim

;semih  bx baslangic var son karakter bx +4
;himes  bp baslangic var
;mov [],[] ; iki adresleme yapamayiz   
; bx icin di azalacak 
; bp icin si artacak
; cx 5 kere donecek 5e ayarlanmali


mov si,4
mov di,0
 
mov cx,5
start:
    mov ax,[bx+si]
    mov [bp+di],ax
    inc di ; inc artiriyor
    dec si ; dec azaltiyor
loop start

ret

    isim db 'semih'
    tersisim db 5 dup(?)

end


