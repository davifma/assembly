# Conceitos
Alguns conceitos fundamentais para programação em Assembly e em muitas outras linguagens de programação. Eles permitem que os programas executem tarefas complexas de maneira estruturada. Durante muito tempo todos os programas foram escritos seguindo exclusivamente essa lógica, hoje, para linguagens de alto nível, paradgmas como Orientação a Objetos ou Orientação a Eventos são mais utilizados e mais efetivos, ainda assim, em algum momento um "procedimento" é criado em seu código.
## Programação Procedural
A programação procedural é um paradigma de programação que se concentra na criação e organização de procedimentos (ou funções) para realizar tarefas específicas. Os procedimentos são blocos de código que podem ser chamados de outros locais do programa para executar uma ação específica.
### Estruturas de Decisão
As estruturas de decisão permitem que um programa tome diferentes caminhos de execução com base em condições específicas. Em Assembly, as estruturas de decisão são geralmente implementadas usando instruções de comparação (cmp) e instruções de salto condicional (jmp).
### Estruturas de Repetição (Loops):
As estruturas de repetição permitem que um bloco de código seja executado repetidamente enquanto uma condição for verdadeira. Em Assembly, os loops são implementados comumente usando um rótulo e instruções de salto condicional (jmp).
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
[código comentado](https://github.com/davifma/assembly/blob/main/estruturas-de-controle/inversor-dfma-comentado.asm)
O programa "inversor" é um pouco mais avançado do que o programa "hi". Enquanto o programa "hi" simplesmente imprime uma mensagem na tela, o programa "inversor" realiza uma tarefa mais complexa: inverter uma string.

## Como funciona
1. **Nome e Origem do Programa:**
```
name "inversor"
org 100h
```
Assim como no programa "hi", começamos definindo o nome do programa como "inversor" e especificamos o ponto de origem do programa.
2. **Declaração da String a Ser Invertida:**
```
texto db '!oditrevni otxeT$'
```
Em seguida, declaramos uma string que queremos inverter. Neste caso, a string é "!oditrevni otxeT$". O cifrão ($) indica o final da string.
3. **Rotina Principal (rotina):**
```
rotina:
    lea bx, texto
    mov si, bx
```
A partir daqui a maior parte da lógica do programa acontece. Começamos carregando o endereço da string na memória para o registrador BX e então movemos esse endereço para o registrador SI.
4. **Loop de Leitura da String (proximo_byte):**
```
proximo_byte:
    cmp [si], '$'
    je ponto_final
    inc si
    jmp proximo_byte
```
Este é um loop que percorre a string até encontrar o final da string (indicado pelo cifrão $). Ele usa o registrador SI para percorrer a string byte a byte.
5. **Inversão da String (inversor):**
```
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
```
Após encontrar o final da string, entramos em um novo loop para inverter a string. Este loop compara os registradores BX e SI para determinar quando chegamos ao meio da string. Então, ele troca os bytes na posição atual de BX e SI até que a string esteja completamente invertida.
6. **Impressão da String Invertida:**
```
pronto:
    lea dx, texto
    mov ah, 09h
    int 21h
```
Depois que a string é invertida, a instrução int 21h é usada para chamar a interrupção do DOS e imprimir a string invertida na tela.
7. **Espera por uma Tecla Pressionada:**
```
pronto:
    mov ah, 0
    int 16h
    ret
```
Finalmente, o programa espera por qualquer tecla ser pressionada antes de retornar ao sistema operacional.

Em resumo, o programa "inversor" é um exemplo de como você pode manipular strings em Assembly. Ele mostra como usar loops, registros e operações de manipulação de strings para realizar uma tarefa mais complexa do que simplesmente imprimir uma mensagem na tela.
<!-- 
## Veja a lógica
Se possível incluir um fluxograma aqui
Referências sobre diagramas 
https://mermaid.js.org/syntax/flowchart.html 
https://docs.github.com/pt/get-started/writing-on-github/working-with-advanced-formatting/creating-diagrams#creating-mermaid-diagrams 
-->
## Elementos usados no código
### Registradores
* **BX (Base Index):** Registrador de 16 bits usado para armazenar endereços de memória.
* **SI (Source Index):** Registrador de 16 bits usado como índice para operações de manipulação de strings.
* **AL (Low Byte of AX):** Registrador de 8 bits usado para armazenar dados de menor ordem do registrador AX.
* **AH (High Byte of AX):** Registrador de 8 bits usado para armazenar dados de maior ordem do registrador AX.
* **DX (Data Register):** Registrador de 16 bits usado para armazenar dados, frequentemente utilizado em operações de E/S.
### Instruções
* **LEA (Load Effective Address):** 
  - Sintaxe: lea destino, origem
  - Carrega o endereço efetivo de uma operação e armazena esse endereço no registrador de destino. Não acessa diretamente a memória.
* **MOV (Move):** 
  - Sintaxe: mov destino, origem
  - Move dados de uma origem para um destino. Pode ser usado para mover dados entre registradores, entre registradores e memória, ou entre memória e registradores.
* **CMP (Compare):** 
  - Sintaxe: cmp operando1, operando2
  - Compara dois operandos, subtraindo o segundo do primeiro e atualizando as flags de acordo com o resultado da subtração, sem alterar os operandos.
* **INC (Increment):** 
  - Sintaxe: inc operando
  - Incrementa o valor de um operando em 1.
* **DEC (Decrement):** 
  - Sintaxe: dec operando
  - Decrementa o valor de um operando em 1.
* **JMP (Jump):** 
  - Sintaxe: jmp destino
  - Instrução de salto incondicional. Faz o programa pular para o rótulo especificado.
* **JAE (Jump if Above or Equal):** 
  - Sintaxe: jae destino
  - Salta para o destino se a flag de carry estiver limpa (0) e a flag de zero estiver limpa (0).
* **RET (Return):** 
  - Não tem operandos.
  - Instrução de retorno. Retorna do procedimento atual para o local de chamada.
### Diretivas
* **NAME (Nome do Programa):** Define o nome do programa.
* **ORG (Origem):** Define o ponto de origem do programa.
### Funções
* **21h (Interrupção de DOS):** Realiza chamadas de sistema para o DOS.
* **16h (Interrupção de BIOS):** Realiza chamadas de sistema para a BIOS.
### Caracteres Especiais
* **'$' (Final da String):** Indica o final de uma string em Assembly.
# Referências
Naser, Ahmad Abdel; **reverse.asm**; Disponível em https://github.com/AhmadNaserTurnkeySolutions/emu8086/blob/master/examples/reverse.asm; jun.13; Acessado em abr.24.

Anonymous; **Assembly**; Disponível em https://chat.openai.com/share/75d93bd9-4f84-4260-9539-948dee6ed712; abr.24; Acessado em abr.24.

