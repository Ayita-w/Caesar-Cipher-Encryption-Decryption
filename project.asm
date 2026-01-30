INCLUDE Irvine32.inc

; ---Function Declaration----
EncryptCaesar PROTO
Decryption PROTO
inputData PROTO
CopyEncryptToData PROTO

.data
key byte ?
data byte  100 dup (0)
encryptData byte 100 dup(0)
digit byte 0
promptData byte "Enter the data: ",0
promptKey  byte "Enter the key-shifts(1-25): ",0
msgEncrypt byte "Encypted Data: ",0
msgDecrypt byte "Decrypted Data: ",0

.code
main PROC
; --------INPUT---------
call inputData

mov al,key
xor ah,ah
mov bl,10
div bl
mov digit , ah ; digit=key%10

;---------Encryption---------
mov edx, offset msgEncrypt
call writestring

call EncryptCaesar
mov edx, offset  encryptData
call writestring
call Crlf
; --------Decryption-------
mov edx, offset msgDecrypt
call writestring

call Decryption   
; decrryption=encryption with inverse key
call CopyEncryptToData

call EncryptCaesar
mov edx, offset  encryptData
call writestring
call crlf

exit
 
main ENDP


; -------Encryption Procedure------------
EncryptCaesar PROC


mov esi, offset data
mov edi, offset encryptData

Enc_loop:
mov al , [esi]
cmp al,0
je Enc_done

; comparison  A-Z

cmp al, 'A'
jb check_low
cmp al, 'Z'
ja check_low

sub al, 'A'
add al,key
xor ah,ah
mov bl, 26  
div bl
mov al, ah  ; remainder in AH  
add al , 'A'
jmp store_encr

; comparison a-z

check_low:
cmp al , 'a'
jb check_digit
cmp al ,'z'
ja check_digit

sub al, 'a'
add al, key
xor ah,ah
mov bl,26
div bl
mov al, ah
add al, 'a'
jmp store_encr

;Comparison  0-9

check_digit:
cmp al , '0'
jb store_encr
cmp al , '9'
ja store_encr

sub al, '0'
add al, digit
xor ah,ah
mov bl, 10
div bl
mov al, ah
add al, '0'
jmp  store_encr

store_encr:
mov [edi],al
inc esi
inc edi
jmp Enc_loop

Enc_done:
mov Byte PTR[edi],0
ret
EncryptCaesar EndP

; -------Decryption Procedure------------
; Decrypting the cipher text

Decryption PROC  

mov bl,key

mov al , 26
sub al , bl
mov key, al

mov al,10
sub al,bl
mov digit,al

ret
Decryption Endp

;------------ Encrypted text back to data----
CopyEncryptToData PROC
mov esi, OFFSET encryptData
mov edi, OFFSET data
CopyLoop:
mov al, [esi]
mov [edi], al
cmp al, 0
je CopyDone
inc esi
inc edi
jmp CopyLoop

CopyDone:
ret
CopyEncryptToData ENDP

; ---------Input Procedure----------

inputData PROC
mov edx, offset promptdata  
call writestring

mov edx, offset data
mov ecx, 100 ;maximum length
call readstring

mov edx, offset data
call writestring
call Crlf
; taking key from user
mov edx, offset promptkey
call writestring
call readint 
mov key, al
ret
inputData EndP

END main


