# Temel bilgiler
```
DB: define byte (8 bit)
DW: define word (16 bit)
```
```
Adres yolu 16bit ise:
16lık sistem en kücük değeri: 0000
16lık sistem en buyuk değeri: ffff

Adres yolu 20bit ise
enkucuk = 00000
enbuyuk = fffff

- 8086 mikroişlemci 20bit adress hattına sahiptir. 
- Kaydediciler 16bit ve direkt olarak 20bit adresleyemediği için segment ve offset adresleri geliştirilmiştir.
- İki tane 16bit sayıdan 20bit elde ediyoruz.
- Hafızanın 64kb ayrılmış bölümlerine segment diyoruz. herbir segment içerisindeki adreslere offset addres ve 0000 dan ffff kadar gidecektir.
- 20bit elde edebilmek için segment adresinin sonuna bir sıfır eklenir ve offset kaydedicideki adres ile toplanır.
- Toplama işlemini 'biu' içerisindeki adres toplayıcı yapmaktadır.
- HATIRLATMA
EU: komutları yorumlamakta ve yürütmektedir.
BIU: ise yol işlemlerini (işlem kodu okuma, operand okuma ve giriş/çıkış cihazlarıyla 
haberleşme gibi) yerine getirir
```

# Kaydediciler:
## Tüm kaydeciler 16 bitlik veri tutabiliyor.
## İki parçaya ayrılan kaydecilerin herbir parçası 8bitlik veri tutuyor.
* DATA REGİSTERS
* * işlenecek verilerin geçici olarak tutulduğu kaydedicilerdir.
* * AX(16bit): accumulator --> AX -> AH & AL
* * BX(16bit): base address--> BX -> BH & BL
* * CX(16bit): counter     --> CX -> CH & CL
* * DX(16bit): data        --> DX -> DH & DL
* SEGMENT REGİSTERS
* * 64kb boyutundaki her bloğun başlangıç adresini tutan kaydedicilerdir.
* * CS: Code Segment
* * DS: Data Segment
* * ES: Extra Segment
* * SS: Stack Segment
* POİNTER REGİSTERS
* * işlenecek kodların veya verilerin RAM üzerinde bulundukları yeri işaret eden kaydedicilerdir.
* * IP: Instruction Pointer
* * BP: Base Pointer
* * SP: Stack Pointer
* INDEX REGİSTERS
* * Belirli veri gruplarında kaynak ve hedefte bulunan verilerin adreslerini tutan kaydedicilerdir.
* * SI: Source Index
* * DI: Destination Index


# Com template kullanımı(emu8086 yazılımı)
* Tek bölüt 64kb segment vardır.
## [Daha ayrıntılı öğrenmek için](https://elearning.algonquincollege.com/coursemat/pincka/dat2343/lectures.f03/33-COM-and-EXE.htm)
```
org 100h
    ; kodlar 
ret
    ; tanımlamalar
    ; boşta kalabilir
    ; end yazılmayadabilir.
end
```
# EXE template kullanımı(emu8086 yazılımı)
```
data segment
   ;tanımlamalar
   ;boşta kalabilir
ends

stack segment
   ;
ends

code segments
start:
   ; kodlar

ends

end start

```



# Temel komutlar
## mov operand1, operand2
```
mov register, memory
mov memory, register
mov register, register
```
örnek1
```
org 100h
    ; yorum satırı
    ; mov taşıma işlemi yapıyor. 

    mov al,5    ; al = 5
    mov ah,7    ; ah = 5
ret
```
örnek2
```
org 100h

mov al,12 ; 12 sayisi 10luk tabanda 
mov al,12h ; h ekleyince 16lik tabanda
mov al,12o ; o ekleyince 8lik tabanda 
mov al, 10000110b; binary belirtmek icin b harfini eklememiz gerekiyor

ret
```
örnek3
```
org 100h

mov al,12h
mov bx,ax  ; ax -> ah ve al diye ikiye ayrildiğini unutmayalim

ret
```
# Lea operand1, operand2
## lea, başlangıç adresi tutar
```
lea register, memory
```
örnek1
```
org 100h
    lea si,sayi1 ; sayi1 in adresini si tutar
    mov ax,[si] ; [adres] -> adresdeki değer. ah=5 olur
ret
    sayi1 db 5
end
```
örnek2
```
org 100h
    lea si,sayilar ; sayilarin başlangıç adresi 'si' de
    mov ax,[si+1] ; ah = 3 olur. '+1' index görevi görüyor.
ret
    sayilar db 1,3,5,7,9,10h,00001010b
end
```
örnek3
```
org 100h
   
   lea si,sayi1
   lea di,sayilar
   mov ah,[si]  ; ah = 5
   mov al,[di]  ; al = 1

ret
   
   sayi1 db 5
   sayilar db 1,3,5,7,9,10h,00001010b
end
```
# XCHG operand1, operand2
## operand1 ile operand2 tutulan değerleri yer değiştirir.
```
xchg register, memory
xchg memory, register
xchg register, register
```

örnek1
```
org 100h
    mov al, 1
    mov ah, 3

    xchg al, ah ; al= 3 olur. ah = 1 olur.
ret
```
# INC operand
## operand değerini 1 arttırır.
```
inc register
inc memory
```
örnek1

```
org 100h
   
   mov al,5
   mov ah,sayi1

   inc al ; al = 6 olur.
   inc ah ; ah = 8 olur.

ret
   
   sayi1 db 7
   
end
```
# DEC operand
## operand değerini 1 azaltır.
örnek1

```
org 100h
   
   mov al,5
   mov ah,sayi1

   dec al ; al = 4 olur.
   dec ah ; ah = 6 olur.

ret
   
   sayi1 db 7
   
end
```
# JUMP etiket
## programda bir yere atlamak için kullanılır.
örnek1
```
org 100h
   ; al = 6 olur. programdan çıkar.

   mov al,5
   
   atla:
     inc al
     ret

   jmp atla


ret
```
örnek2
```
org 100h
   
   mov al,5
   
   jmp atla
   
        ; atlama yapıldıktan sonra al = 6 olur. ret e girer.
        ; bir önceki örnekte jmp içerisinde ret kullandık sebebi ise atlama etiketi aşağıda tanımlanıp yukarıya atlamasını istedik eğer ret yazmazsak programdan çıkamayız.
        ; illaki ret yazmamızda şart değil tekrar atlama kullanarak rete yönlendirebiliriz

   atla:
   inc al


ret
```
örnek3
```
org 100h
   
   mov al,5
   
   atla:
   
      jmp devam
   
   jmp atla
   inc al

   devam:
ret
   
   sayi1 db 7
   
end

```
# LOOP operand
## Operand bir etikettir. Döngü oluşturmak istediğimiz işlemler için kullanılır
```
org 100h
   
   mov al,0
   
   mov cx,5 
   ; cx döngünün kaç defa döneceğini belirler. bunu her zaman yazmamız gerekir
   ; loop komutu cx değerini her döngüde bir azaltır
   ; cx sıfır olana kadar devam eder.
   dongu:
     inc al
   loop dongu
   
ret
```
# PUSH operand
## operanddaki 16bitlik veriyi stack hafızaya yükler

```
push register
push segmentregister
push memory
```
SP, Stack Segment için ayrılan alanın en tepesini(son adresi) gösterir.Her işlemde sp 2 azaltılır.

örnek1
```
org 100h
   ; önce ax e 30 sayisini attık
   ; sonra stack hafızayada yükledik
   ; ax e tekrar bir sayi atip
   ; pop ile stack hafızadan 30 alıp tekrar yükledik

   mov ax,30h
   push ax
   
   mov ax,122h
   pop ax ; operandda bulunan veriyi stack hafızadan alır
   
   
ret

```

# ADD operand1, operand2
## operand1 ve operand2 toplanıp sonuc operand1e atılır
```
add register, memory
add memory, register
add register, register
add memory, immediate ; örneğin: add al,5
add register, immediate
```

```
org 100h

  mov ah,10h
  mov al,10h
  add ah,al  ; ah = 20 olur
ret
```
# SUB operand1, operand2
## operand1den operand2 çıkartılıp operand1e yüklenir.
```
sub register, memory
sub memory, register
sub register, register
sub memory, immediate ; örneğin: add al,5
sub register, immediate
```
```
org 100h

  mov ah,10h
  mov al,10h
  sub ah,al 
ret
```
# MUL operand1
örnek1
```
org 100h

    mov al,4
    mul al

ret
```
örnek2
```
org 100h

    mov al,4
    mul [sayi]

ret
   sayi db 3
end
```



#


