# Laboratório 8 - ASM 2

## Instruções Iniciais

Neste laboratório vamos criar uma biblioteca de stings para a MVN utilizando a ligação parcial. O experimento foi inspirado na biblioteca [`string.h`](https://cplusplus.com/reference/cstring/) do GCC.

### Definições

Uma string é um vetor de caracteres seguindo a tabela ASCII, terminada por um `NULL` (`'\0'` ou `0x00`).

## Exercicios

### `STRLEN`

Implemente uma função `STRLEN` que recebe no acumulador o endereço de uma string e retorna no acumulador o tamanho em bytes dessa string.

Referência: [strlen](https://cplusplus.com/reference/cstring/strlen/)

### `STRCMP`

Implemente uma função `STRCMP` que recebe dois argumentos `STRCMP_A` e `STRCMP_B`, com posições de strings que serão comparadas, caractere a caractere, seguindo o valor deles na tabela ASCII. Caso `STRCMP_A` seja maior que `STRCMP_B`, retorna `1`; se for igual, `0`; se for menor, `-1` (em complemento de 2).

Referência: [strcmp](https://cplusplus.com/reference/cstring/strcmp/)

## Entrega

Arquivo: `string.asm` com o código relocável, utilizandos os labels indicados acima.

## Links

- [`mvn-cli`](https://github.com/PCS3616/mvn-rs)

## Execução

```bash
./mvn-cli assemble -i string.asm > string.int
./mvn-cli assemble -i test_len.asm > test_len.int
./mvn-cli link -i program.int -i string.int --complete > program.lig
./mvn-cli relocate -i program.lig --base 0 > program.mvn
```

## Correção

Os arquivos de teste estão disponíveis em `asm`.
