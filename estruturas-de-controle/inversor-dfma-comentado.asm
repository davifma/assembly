; inverter um texto

name "inversor"   ; Define o nome do programa como "inversor"

org 100h          ; Define o ponto de origem do programa como 100h (endereco de inicio da execucao)
jmp rotina        ; Pula para o rotulo "rotina", ignorando a declaracao de dados no inicio

texto db '!oditrevni otxeT$'  ; Define uma string para ser invertida. "$" indica o final da string.

rotina:              ; Rotulo de inicio do programa

    lea bx, texto   ; Carrega o endereco da string na memoria para o registrador BX 
                    ; "lea" - instrucao de carregamento de endereco efetivo (Load Effective Address).
                    ; "bx" - registrador de 16 bits para armazenar enderecos de memoria, para armazenar o endereco efetivo calculado por "lea".
                    ; "texto" - rotulo que representa o inicio da string que queremos manipular.
    
    mov si, bx      ; Move o conteudo de BX para SI
                    ; "si" - registrador de 16 bits, "source index" (indice de origem).

proximo_byte:         ; Rotulo para o loop de leitura da string
    
    cmp [si], '$'     ; Compara o byte atual apontado por SI com "$"
    je ponto_final    ; Se for "$", pula para ponto_final
    inc si            ; Incrementa SI para apontar para o proximo byte da string
    jmp proximo_byte  ; Pula de volta para proximo_byte para continuar o loop de leitura

ponto_final:        ; Rotulo para o ponto final do loop de leitura
    dec si          ; Decrementa SI para voltar ao ultimo byte da string (para ignorar o "$")

inversor:          ; Rotulo para a inversao da string
    cmp bx, si     ; Compara os registradores BX e SI para verificar se chegamos ao meio da string
    jae pronto     ; Se BX for maior ou igual a SI, a inversao esta completa, entao pula para pronto

    mov al, [bx]   ; Move o byte apontado por BX para AL
    mov ah, [si]   ; Move o byte apontado por SI para AH

    mov [si], al   ; Move o conteudo de AL para o byte apontado por SI
    mov [bx], ah   ; Move o conteudo de AH para o byte apontado por BX

    inc bx         ; Incrementa BX para avancar para o proximo byte da string
    dec si         ; Decrementa SI para retroceder para o proximo byte da string

    jmp inversor   ; Pula de volta para inversor para continuar a inversão da string

pronto:             ; Rotulo para quando a inversao estiver completa
    lea dx, texto   ; Carrega o endereco da string invertida para DX
    mov ah, 09h     ; Define a funcao de impressao de string do DOS
    int 21h         ; Chama a interrupcao do DOS para imprimir a string invertida

    mov ah, 0       ; Define a funcao de espera por tecla pressionada
    int 16h         ; Chama a interrupcao de BIOS para esperar por qualquer tecla pressionada

ret               ; Retorna ao sistema operacional   

;** Revisao ** 
;https://github.com/davifma/assembly/blob/main/introducao/readme.md 

;** Novos Elementos Assembly usados neste codigo **

;* Registradores *
;"SI" (Source Index) - Registrador de 16 bits usado como indice para operacoes de manipulacao de strings.
;"AL" (Low Byte of AX) - Registrador de 8 bits usado para armazenar dados de menor ordem do registrador AX.
;"BX" - Base, ponteiro de dados;

;* Instrucoes *
;"LEA" (Load Effective Address) - Carrega o endereco efetivo de uma operacao e armazena esse endereco no registrador de destino. Nao acessa diretamente a memoria.
;                               Sintaxe: lea destino, origem

;"CMP" (Compare) - Compara dois operandos, subtraindo o segundo do primeiro e atualizando as flags de acordo com o resultado da subtracao, sem alterar os operandos. 
;                Sintaxe: cmp valor1, valor2
;                Onde os valores ("valor1" e "valor2") sao os dados que serao comparados. 

;"INC" (Increment) - Incrementa o valor de um operando em 1.
;                  Sintaxe: inc valor
;                  Onde "valor" e o valor que sera incrementado.

;"DEC" (Decrement) - Decrementa o valor de um operando em 1.
;                  Sintaxe: dec valor
;                  Onde "valor" e o valor que sera decrementado.

;JAE (Jump if Above or Equal) - Salta para o destino se a flag de carry estiver limpa (0) e a flag de zero estiver limpa (0). 
;                             Sintaxe: jae destino
;                             Onde destino e o rotulo para onde se deseja saltar


;* Funcoes *
;"16h" - funcionalidades relacionadas ao teclado em Assembly. 

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

; "cx" - Contador, frequentemente usado para contagem e iteracao;
; "dx" - Dados, entrada/saída (E/S) e operaoes aritmeticas. 

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