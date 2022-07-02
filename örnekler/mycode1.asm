
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al,12 ;12 sayisi 10luk tabanda 
mov al,12h ;h ekleyince 16lik tabanda
mov al,12o ;o ekleyince 8lik tabanda 
mov al, 10000110b;binary belirtmek icin b harfini eklememiz gerekiyor
ret

end 


