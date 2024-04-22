; Exemplo de escrita na memoria de video 
name "letrabrilhante"

org 100h              
MOV AX, 0B800h        ; Carrega 0B800h em AX, endereco base do segmento de video para o modo texto colorido.
MOV DS, AX            ; Define DS para o endereco base da memeria de video (AX).
MOV CL, 'A'           ; Move o caractere 'A' para o registrador CL.
MOV CH, 1101_1111b    ; Move o valor binsrio 1101_1111 para CH (cor do texto _ cor de fundo).
MOV BX, 15Eh          ; Move o valor 15Eh para BX, deslocamento na memoria de video onde o caractere e os atributos serao escritos.
MOV [BX], CX          ; Escreve o valor de CX na posicao de memoria apontada por BX.
                      ; Como CX contem o caractere em CL e os atributos em CH, isso configura tanto o caractere quanto seus atributos na tela.
RET                  




