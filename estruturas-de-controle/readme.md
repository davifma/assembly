# inversor
```
name "inversor"
org 100h
jmp rotina
texto db '!oditrevni otxeT$'
rotina:
    lea bx, texto   
    mov si, bx      
proximo_byte:
    cmp [si], '$' 
    je ponto_final
    inc si
    jmp proximo_byte
ponto_final:
    dec si  
inversor:
    cmp bx, si
    jae pronto
    mov al, [bx]
    mov ah, [si]
    mov [si], al
    mov [bx], ah
    inc bx
    dec si
    jmp inversor
pronto
    lea dx, texto
    mov ah, 09h
    int 21h
    mov ah, 0
    int 16h
ret
```
