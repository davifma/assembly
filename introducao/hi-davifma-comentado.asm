; The easiest way to print out "Hello, World!"

name "oi"   ; Define o nome do programa como "hi"
org 100h    ; Define o ponto de origem do programa como 100h (endereco de inicio da execucao)
jmp rotina   ; Pula para o rotulo "rotina", ignorando a declaracao de dados

msg:        ; Define um rotulo chamado "msg" para o inicio da mensagem
    db "Ola mundo!", 0Dh, 0Ah, 24h    ; Define a mensagem a ser impressa 
                                         ; "db" - diretiva para "definir bytes" na memoria.
                                         ; "Hello, World!" - string que sera armazenada na memoria
                                         ; "0Dh" - Caractere de retorno de carro (CR) em hexadecimal
                                         ; "0Ah" - Caractere de alimentacao de linha (LF) em hexadecimal. 
                                         ; "24h" - De final de texto ($) em hexadecimal.
rotina:      ; Rotulo de inicio do programa
    mov dx, msg    ; Move o endereco da mensagem para o registrador dx 
                   ; "mov" - Esta instrucao move (copia) o valor de um operando para outro.
                   ; "dx" - Registrador, usado para armazenar enderecos de dados.
                   ; "msg" - Rotulo do endereço inicial na memoria. 
                   
    mov ah, 09h    ; Funcao de impressao
                   ; "ah" - Registrador, parte alta do registrador AX, passa o codigo da funcao para os servicos de interrupcao.
                   ; "09h" Hexadecimal que representa a funcao de impressao de string do DOS.
                    
    int 21h        ; Chama a interrupao do DOS para imprimir a mensagem
                   ; "int" - Instrucao de interrupcao.
                   ; "21h" - Numero da interrupao usado para operacoes impressao, entre outras.

ret ; Retorna ao sistema operacional.


;** Outros Elementos Assembly usados neste codigo **

;* Registradores *
; "DX" - Registrador usado para armazenar enderecos de dados na arquitetura x86.
; "AH" - Parte alta do registrador AX, usado para passar o codigo da funcao para os servicos de interrupcao do DOS.

;* Instrucoes *
; "JMP" - Instrucao de salto condicional ou incondicional.
;         Sintaxe: JMP destino
;                  Onde "destino" e rotulo para onde o programa deve saltar

; "MOV" - Instrucao para mover (copiar) dados entre operandos. 
;         Sintaxe: MOV destino, origem
;                  Onde "destino" e Local onde os dados serao movidos e "origem" de onde os dados serao copiados.

; "INT" - Instrucao de interrupcao usada para solicitar servicos do sistema operacional. 
;         Sintaxe: INT valor
;                  Onde "valor" e o numero que representa o servico a ser solicitado ao sistema operacional.

; "RET" - Instrucao de retorno, utilizada para retornar de uma sub-rotina.
;         Sintaxe: RET

;* Diretivas *
; "ORG" - Diretiva para definir o ponto de ORiGem do programa. 
;         Sintaxe: ORG endereco
;                  Onde "endereco" e o endereco de memoria onde o programa comecara a ser executado.

; "DB" - Diretiva para "Definir Bytes" na memoria. Usado para declarar strings, constantes, etc.
;        Sintaxe: DB valor1, valor2, ...
;                 Onde os valores ("Valor1, Valor2,.., ValorN) sao dados a serem armazenados na memoria, como strings, constantes, etc.

; "NAME" - Diretiva para definir o nome do programa.
;          Sintaxe: NAME "nome"    
;                   Onde "nome" e o nome do programa, usado para identifica-lo.


;* Funcoes *
; "09h" - Funcao de impressao de string do DOS.

;* Caracteres Especiais *
; "0Dh" - Caractere de retorno de carro (CR) em hexadecimal.
; "0Ah" - Caractere de alimentacao de linha (LF) em hexadecimal.
; "24h' - Caractere de final de texto ($) em hexadecimal. 

; *** Um pouco mais sobre assembly ***

; ** Outras instrucoes **

; * Fluxo *
; "call" - Chama um procedimento ou sub-rotina.
;          Sintaxe: 
;                  call destino
;          onde destino e o rotulo ou endereço do procedimento a ser chamado. 
; "ret" - Retorna de uma sub-rotina.
;         Sintaxe: 
;                  ret

; * Movimentacao de Dados *     
; "lea" - Carrega o endereco efetivo de uma variavel em um registrador.
;         Sintaxe:
;                  lea registrador, variavel
;         onde registrador e o registrador de destino e variavel e o operando de origem.  

; * Entrada e Saida *
; "in" - Le dados de uma porta de E/S para um registrador.
;        Sintaxe: 
;                 in registrador, porta
;        onde registrador e o registrador de destino e porta e o numero da porta de E/S.   
; "out" - Escreve dados de um registrador para uma porta de E/S.
;         Sintaxe: 
;                 out porta, registrador
;         onde porta e o numero da porta de E/S e registrador e o registrador de origem.

; * Manipulacao de pilha *
; "push" - Empurra um valor para a pilha.   
;          Sintaxe: 
;                  push valor
;          onde valor e o dado a ser empurrado para a pilha.
; "pop" - Retira um valor da pilha.
;         Sintaxe: 
;                 pop destino
;         onde destino e o registrador ou variável que recebera o valor retirado da pilha.     

; * Aritmeticas e logicas *
; "add", "sub", "mul", "div", "inc", "dec", "and", "or", "xor", entre outras. 
;         Essas instrucoes realizam operacoes aritmeticas e logicas em dados. 
;         Exemplos de Sintaxe:
;                             add destino, origem
;         onde destino e onde o resultado sera armazenado e origem e o valor que sera somado ao destino
;                             and destino, origem
;         onde destino é onde o resultado de & (and) sera armazenado e origem e a informacao que sera
;         & (And) bit a bit com o destino 

; ** Outras diretivas **

; "dw" - Define uma palavra (word) de 16 bits na memoria.
; "dd" - Define uma dupla palavra (double word) de 32 bits na memoria.
; "dq" - Define uma quadra palavra (quad word) de 64 bits na memória.
; "resb" - Reserva um numero especificado de bytes.
; "resw" - Reserva um numero especificado de palavras (words).
; "resd" - Reserva um numero especificado de duplas palavras (double words).
; "resq" - Reserva um numero especificado de quadras palavras (quad words).
; "equ" - Define constantes simbolicas.


; ** Outros registradores **

; * 16 bits *
; "ax" - Acumulador, operacoes aritmeticas e manipulacao de dados;
; "bx" - Base, ponteiro de dados;
; "cx" - Contador, frequentemente usado para contagem e iteracao;
; "dx" - Dados, entrada/saída (E/S) e operaoes aritmeticas. 

; * 8 bits *      
; "ah" - Parte alta do registrador ax, codigos de funcao em chamadas de interrupao;
; "al" - Parte baixa do registrador ax, manipulação de bytes de dados.

; * Segmento *
; "cs" - Codigo, endereco base do segmento de codigo;
; "ds" - Dados, endereco base do segmento de dados;     
; "es" - Extra, segmento adicional para dados;
; "ss" - Pilha, endereco base do segmento de pilha.

; * Ponteiro *
; "si" - Indice de origem, para apontar para dados em operacoes de manipulacao de strings;
; "di" - Indice de destino, para apontar para destinos em operacoes de manipulacao de strings;
; "bp" - Ponteiro de base, usado como um ponteiro de base para acessar dados na pilha;
; "sp" - Ponteiro de pilha, o endereco atual do topo da pilha. 