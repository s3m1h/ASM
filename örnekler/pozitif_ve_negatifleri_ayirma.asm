
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
   
   
   lea bx,sayilar
   mov si,0
   mov di,0
   mov bp,0
   mov cx,7
   
   
   dongu:
   cmp [bx+si],0
   jl negatif ; if less
   jg pozitif ; if greater
   jmp esittir
   
   
   negatif:
        mov al,[bx+si]
        mov [negatifler+di],al
        inc di
        inc si
        jmp atla
   
   pozitif:
        mov ah,[bx+si]
        mov [pozitifler+bp],ah
        inc si
        inc bp
        jmp atla
        
   esittir:
        jmp bitir     
   atla:
       
   loop dongu
   
  bitir: 
   
ret
    sayilar db -2,1,-1,4,-9,15,0
    negatifler db 4 dup(?)
    pozitifler db 4 dup(?)

end