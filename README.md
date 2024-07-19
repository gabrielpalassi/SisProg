# Sistemas de Programação

Bem-vindo ao repositório dos Laboratórios da disciplina PCS3616 - Sistemas de Programação da Poli-USP. Este repositório contém os exercícios e projetos mais interessantes desenvolvidos ao longo do quadrimestre, cobrindo diversas áreas, como máquinas de Turing, linguagem de máquina MVN, e Assembly.

## Conteúdo do Repositório

Este repositório é dividido em diretórios que correspondem a diferentes laboratórios realizados durante o curso:

### Lab 1 - Simulação de Máquinas de Turing

#### Objetivo:

Implementar máquinas de Turing para realizar operações básicas.

- `mt_soma.txt`: Implementa uma Máquina de Turing que calcula a soma `x + y`.
- `mt_subtracao.txt`: Implementa uma Máquina de Turing que calcula a subtração `x - y`, com `x > y` e tratamento de erros.
- `mt_soma_binaria.txt`: Implementa uma Máquina de Turing que calcula a soma `x + y` em binário, com tamanho máximo de dígitos limitado a 8.

#### Instruções:

- Instalar as ferramentas necessárias.
- Testar o código usando o script python.

### Lab 2 - Simulador e Programação MVN

#### Objetivo:

Criar e testar programas na linguagem de máquina MVN para operações aritméticas e de entrada/saída.

- `ex1-soma.mvn`: Soma dois valores e armazena o resultado em uma posição de memória.
- `ex2-subtracao.mvn`: Subtrai dois valores usando uma sub-rotina.
- `ex3-io.mvn`: Lê dois números do teclado e imprime a soma.

#### Instruções:

- Baixar e inicializar o simulador MVN.
- Executar os programas usando o terminal Python ou diretamente.

### Lab 3 - Triângulos e Mnemônicos em MVN

#### Objetivo: Implementar máquinas de Turing para realizar operações básicas.

- `triangulos.mvn`: Determina se três valores formam um triângulo e qual o tipo.
- `op-mnem.mvn`: Converte entre códigos de operações e seus mnemônicos.
- `quadrados-perfeitos.mvn`: Calcula e tabela os quadrados perfeitos dos primeiros 64 números naturais.

#### Instruções:

- Instalar as ferramentas necessárias.
- Testar o código usando o simulador MVN.

### Lab 4 - Pilha e Mnemônicos em Assembly MVN

#### Objetivo:

Escrever e testar código em Assembly (ASM) para MVN, incluindo a implementação de sub-rotinas e uso da pilha.

- `op-mnem.asm`: Implementa as sub-rotinas `OP2MNEM` e `MNEM2OP` em Assembly.
- `stack.asm`: Implementa rotinas para empilhar e desempilhar valores usando a pilha da MVN.

#### Instruções:

- Instalar as ferramentas de montagem, ligação e relocação.
- Compilar e testar o código ASM gerado.

### Lab 5 - Biblioteca de Strings em Assembly MVN

#### Objetivo: Implementar máquinas de Turing para realizar operações básicas.

- `string.asm`: Implementa funções `STRLEN` e `STRCMP` para manipulação de strings.

#### Instruções:

- Montar, ligar e relocar o código ASM.
- Testar as funções de manipulação de strings.

## Instalação e Uso

Para compilar e testar os programas, siga as instruções específicas em cada laboratório para instalar ferramentas e executar o código (`README.md` de cada diretório). Referências para ferramentas e exemplos de execução estão disponíveis nos arquivos de cada laboratório.

## Links Úteis

- [Repositório do `mvn-cli`](https://github.com/PCS3616/mvn-rs)
