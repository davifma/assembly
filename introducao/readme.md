# oi
``` 
name "oi" 
org 100h 
jmp rotina 
msg:        
    db "Ola mundo!", 0Dh, 0Ah, 24h                                    
rotina:     
    mov dx, msg    
    mov ah, 09h    
    int 21h     
ret
```
[código comentado](https://github.com/davifma/assembly/blob/main/introducao/hi-davifma-comentado.asm)
## Programação em Assembly
Assembly é uma linguagem de baixo nível usada para programar computadores. Ela é muito próxima da linguagem de máquina que os processadores entendem, o que a torna poderosa, mas também mais complexa do que linguagens de alto nível, como Python ou JavaScript.

O programa "hi" que estamos analisando é um exemplo simples em Assembly. Ele imprime a mensagem "Hello, World!" na tela do computador. Vamos quebrar o código em partes para entender o que está acontecendo.

Lembrando que este programa foi escrito para rodar no software **emu8086**
### O que o programa "hi" faz?
1. **Definindo o nome e o ponto de origem:**
```
name "oi"
org 100h
```
Aqui, estamos dando um nome ao nosso programa (**"hi"**) e definindo o ponto de **or**i**g**em dele como o endereço **100h** na memória.

2. **Pulando para a rotina principal:**
```
jmp rotina
```
Esta instrução diz ao computador para pular (**j**u**mp**) para a **rotina** principal do programa, ignorando as declarações de dados no início.

3. **Definindo a mensagem:**
```
msg: db "Ola mundo!", 0Dh, 0Ah, 24h
```
Aqui, estamos definindo uma mensagem que queremos imprimir na tela. A diretiva **db** é usada para **d**efinir **b**ytes na memória, e usamos valores em hexadecimal para representar os caracteres especiais (**0Dh** para retorno de carro, **0Ah** para nova linha e **24h** para o final de texto).

4. **Rotina principal:**
```
rotina:
mov dx, msg
mov ah, 09h
int 21h
```
Na **rotina** principal, primeiro carregamos o endereço da mensagem para o registrador **DX**, depois configuramos o registrador **AH** com o valor **09h** (indicando que queremos imprimir uma string) e finalmente chamamos a interrupção do DOS (**int 21h**) para imprimir a mensagem na tela.

5. **Retornando ao sistema operacional:**
```
ret
```
Depois que a mensagem é impressa, usamos a instrução **ret** para **ret**ornar ao sistema operacional.
### Conclusão
Este é um exemplo básico de programação em Assembly. Embora possa parecer complicado no início, entender os conceitos básicos pode ajudar a desvendar a magia por trás do funcionamento dos computadores. À medida que continuamos aprendendo, exploraremos mais conceitos e construiremos programas mais complexos.
## Usamos nesse exemplo
### Registradores
* **DX:** Registrador usado para armazenar endereços de dados na arquitetura x86.
* **AH:** Parte alta do registrador AX, usado para passar o código da função para os serviços de interrupção do DOS.
### Instruções
* **JMP:** Instrução de salto condicional ou incondicional.
  - Sintaxe: **JMP *destino***
    - Significado: Salta para o destino especificado.
    - ***destino***: Rótulo para onde o programa deve saltar.
* **MOV:** Instrução para mover (copiar) dados entre operandos.
  - Sintaxe: **MOV *destino*, *origem***
    - Significado: Move (copia) dados da origem para o destino.
    - ***destino***: Local onde os dados serão movidos.
    - ***origem***: Local de onde os dados serão copiados.
```
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
```
https://github.com/davifma/assembly/blob/main/introducao/mov-letra-brilhante-dfma-comentado.asm
* **INT:** Instrução de interrupção usada para solicitar serviços do sistema operacional.
  - Sintaxe: **INT *valor***
    - Significado: Chama a interrupção do sistema operacional com o valor especificado.
    - ***valor***: Número que representa o serviço a ser solicitado ao sistema operacional.
```
name "ola"
ORG 100h                
MOV AH, 0Eh  ; Define a funcao do BIOS para exibir caracteres.
MOV AL, 'O'  ; Define o primeiro caractere a ser exibido.
INT 10h      ; Exibe o caractere 'O'.
MOV AL, 'l'  ; Define o proximo caractere a ser exibido.
INT 10h      ; Exibe o caractere 'l'.
MOV AL, 'a'             
INT 10h                 
MOV AL, '!'             
INT 10h                               
RET
```
https://github.com/davifma/assembly/blob/main/introducao/ola-comentado-dfma.asm
* **RET:** Instrução de retorno, utilizada para retornar de uma sub-rotina.
  - Sintaxe: **RET**
    - Significado: Retorna ao ponto de chamada após a execução de uma sub-rotina.
    - Não possui argumentos adicionais.
### Diretivas
* **ORG:** Diretiva para definir o ponto de origem do programa.
  - Sintaxe: **ORG *endereço***
    - Significado: Define o ponto de origem do programa como o endereço especificado.
    - ***endereço***: Endereço de memória onde o programa começará a ser executado.
* **DB:** Diretiva para definir bytes na memória. Usado para declarar strings, constantes, etc.
  - Sintaxe: **DB *valor1*, *valor2*, ...**
    - Significado: Define bytes na memória com os valores especificados.
    - Valores(***valor1***, ***valor2***, .., ***ValorN***): Dados a serem armazenados na memória, como strings, constantes, etc.
* **NAME:** Diretiva para definir o nome do programa.
  - Sintaxe: **NAME *"nome"***
    - Significado: Define o nome do programa como o especificado.
    - ***"nome"***: Nome do programa, usado para identificá-lo.
### Funções
* **09h:** Função de impressão de string do DOS.
### Caracteres Especiais
* **0Dh:** Caractere de retorno de carro (CR) em hexadecimal.
* **0Ah:** Caractere de alimentação de linha (LF) em hexadecimal.
* **24h:** Caractere de final de texto ($) em hexadecimal.
## Referências
Naser, Ahmad Abdel; **HelloWorld.asm**; Disponível em https://github.com/AhmadNaserTurnkeySolutions/emu8086/blob/master/examples/HelloWorld.asm; jun.23; Acessado em abr.24.

Anonymous; **Assembly**; Disponível em https://chat.openai.com/share/75d93bd9-4f84-4260-9539-948dee6ed712; abr.24; Acessado em abr.24. 
