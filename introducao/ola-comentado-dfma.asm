name "ola"
ORG 100h                
MOV AH, 0Eh             ; Define a funcao do BIOS para exibir caracteres.
MOV AL, 'O'             ; Define o primeiro caractere a ser exibido.
INT 10h                 ; Exibe o caractere 'O'.
MOV AL, 'l'             ; Define o proximo caractere a ser exibido.
INT 10h                 ; Exibe o caractere 'l'.
MOV AL, 'a'             
INT 10h                 
MOV AL, '!'             
INT 10h                               
RET                     