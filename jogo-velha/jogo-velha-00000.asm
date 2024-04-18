; Tabuleiro simples para jogo da velha
name "jodo-velha-00000"

org 100h
jmp mostra


tabuleiro: ; construcao o tabuleiro
    db 0Dh,0Ah,"  7 | 8 | 9 ",0Dh,0Ah," -----------",0Dh,0Ah,"  4 | 5 | 6 ", 0Dh, 0Ah," -----------", 0Dh, 0Ah, "  1 | 2 | 3 ", 24h   
    
mostra:
    mov dx, tabuleiro ; carrega tabuleiro               
    mov ah, 09h       ; Funcao de impressao                 
    int 21h           ; Imprime
ret
