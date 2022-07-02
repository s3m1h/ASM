
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

lea bx,sayilar; baslangic adresini aldik
lea bp,sayilar2                         

;mov [bp],[bx]; boyle bir kullanim yok
; gecici islemlerde genelde ax kullanilir
mov al,[bx]
mov [bp],al

mov al,[bx+1]
mov [bp+1],al

mov al,[bx+2]
mov [bp+2],al

mov al,[bx+3]
mov [bp+3],al





ret
sayilar db 2,3,5,7
sayilar2 db 4 dup(?);4 tane bosluk olusturmak
end



