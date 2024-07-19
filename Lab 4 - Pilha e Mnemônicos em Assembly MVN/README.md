# Laboratório 4 - ASM 1

## Instruções Iniciais

Neste laboratório, começaremos o estudo e uso da linguagem de montagem da MVN (ASM) e da função de pilha implementada na MVN. A partir deste laboratório, você escreverá códigos apenas em ASM e utilizará os módulos Montador, Ligador e Relocador.

### Instalação das Ferramentas

As ferramentas necessárias são escritas em Rust. Você pode instalar o executável seguindo as instruções disponíveis [neste repositório](https://github.com/PCS3616/mvn-rs#readme).

### Execução do Código Gerado

Para executar o código MVN gerado, siga o mesmo procedimento utilizado para o código MVN escrito manualmente.

## Exercícios

### op-mnem.asm

Você deve escrever uma versão em ASM do programa que anteriormente foi escrito em linguagem de máquina. O programa deve incluir as sub-rotinas `OP2MNEM` e `MNEM2OP`.

#### Especificações do Programa:

- Nome do arquivo: `op-mnem.asm`.

- Layout da memória:

| Endereço/Rótulo | Conteúdo                              |
| --------------- | ------------------------------------- |
| `0x000`         | Jump para o programa principal        |
| `OPCODE`        | Variável OPCODE (variável \"global\") |
| `MNEM`          | Variável MNEM (variável \"global\")   |
| `OP2MNEM`       | Sub-rotina OP2MNEM                    |
| `MNEM2OP`       | Sub-rotina MNEM2OP                    |
| `0x0300` `MAIN` | Programa principal                    |
| `TABELA`        | Tabela de mnemônicos                  |

Entrega: arquivo `op-mnem.asm`

### Uso da Pilha na MVN

Você deve criar três rotinas utilizando a pilha implementada na MVN.

#### Funções da Pilha

A pilha é operada com a instrução OS (supervisor). O código da função a ser executada pelo supervisor deve ser carregado no acumulador e o código de operação da função é `0x57`. A chamada deve ser feita da seguinte forma: `OS /<NUM_ARG><FUNC>`.

- `NUM_ARG = 0` para funções de get (sem parâmetro).
- `NUM_ARG = 1` para funções de set (com um parâmetro).
- `FUNC = 0x57` indica a função a ser empregada.

#### Exemplo de Chamada:

Para chamar a função de pilha de código 3 passando o argumento 1:

```asm
        LV = 1      ; Escreve 1 no endereço
        MM OS_ARG   ; logo antes da chamada de OS
        LV = 3      ; Função de código 3
        JP OS_CALL
OS_ARG  $ = 1
OS_CALL OS /157
```

A pilha será implementada de forma decrescente. O endereço de stack-pointer (SP) da pilha estará inicializado. Para conhecer seu valor, utilize a função `0x0`. Para preencher o novo valor, decrementando de dois, utilize a função `0x1`. Para colocar um valor no endereço apontado pelo SP, utilize a função `0x3` e depois corrija o SP decrementando dois. Para capturar um valor do topo da pilha, utilize a função `0x2` e antes, corrija o SP incrementando dois.

#### Funções da Pilha:

| Função        | Valor | Descrição                                                                    |
| ------------- | ----- | ---------------------------------------------------------------------------- |
| get pointer   | 0     | Salva em AC valor do SP                                                      |
| set pointer   | 1     | Salva no SP o valor passado como argumento                                   |
| get stack top | 2     | Salva em AC o valor no endereço de memória apontado pelo SP                  |
| set stack top | 3     | Salva no endereço de memória apontado pelo SP o valor passado como argumento |

### Rotinas a Serem Implementadas:

| Rotina     | Rótulo | Descrição                                                          |
| ---------- | ------ | ------------------------------------------------------------------ |
| Empilha    | `EMPI` | Lê uma variável global `VALOR` e empilha seu conteúdo              |
| Desempilha | `DEMP` | Desempilha um valor e salva na variável global `VALOR`             |
| Principal  | `MAIN` | Lê uma entrada do teclado, empilha, desempilha e a escreve na tela |

Observações importantes:

- Não esqueça de exportar todos os nomes

- Não utilize os endereços `0xF00` e `0xF02`.

Entrega: arquivo stack.asm contendo as três rotinas.
