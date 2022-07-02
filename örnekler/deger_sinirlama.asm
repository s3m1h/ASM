
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
   ;0000 1111 = 8+4+2+1=15
   ;0001 1100 = 28
   
   lea bx, sayilar
   mov si,0
   mov cx,4
   ; and operand1,operand2
   ; mov al, 'a'
   ; and al,1101 1111b; al= 0100 0001b ('A')
   
   dongu:
       ;mov al,[bx+si]
       ;and al,00001111b;0 ile 15 arasina cekmis olacagiz
       ;mov [bx+si],al
       and [bx+si],00001111b;
       inc si
   
   loop dongu
   

ret

   sayilar db 16,28,18,42
end


