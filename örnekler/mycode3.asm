
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
   
   ;jmp gec
   ;   m1 db "semih$"
   ;gec:
      lea dx, m1
      mov ah,9
      int 21h
          
      lea dx, m2
      mov ah,2
      int 21h    
          
                    
                    
ret 

m1 db "semih$"
m2 db "acar$" 




