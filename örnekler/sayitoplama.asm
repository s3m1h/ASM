
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
   
    lea dx,m1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    
    sub al,48; yukarida girilen tus al'ye atilmisti
    ; burada ise o degerden 48 cikariyoruz
    
    cmp al,13
    
    ; cmp komutunun sonucu esit degilse dev1 etiketine atliyoruz
    jne dev1 ; jump if not equal
        int 20h
    dev1:
    
    ;-------------------
    lea dx,m2
    mov ah,9
    int 21h
    
    mov ah,1 ;bir tusa bas basilan tusun ascii kodu AL'ye konur
    int 21h                    
    
    sub al,48
    add al,bl
    daa
    mov bl,al
                        
    ;-------------------
    lea dx,m3
    mov ah,9
    int 21h
    
    mov cl,4
    mov ch,2
                                                     
    devamBL:
        rol bl,cl
        mov dl,bl
        and dl,0Fh
        add dl,48
        cmp dl,58
        
        jl git
            add dl,7                     
        git:
        mov ah,2
        int 21h
        dec ch
        
    jnz devamBL
   
ret
    
    m1 db 13,10,'birinci sayi:$'
    m2 db 13,10,'ikinci sayi:$'
    m3 db 13,10,'toplam:$'


end
                              