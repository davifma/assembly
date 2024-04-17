# hi
``` 
name "hi" 
org 100h 
jmp rotina 
msg:        
    db "Hello, World!", 0Dh, 0Ah, 24h                                    
rotina:     
    mov dx, msg    
    mov ah, 09h    
    int 21h     
ret
``` 
