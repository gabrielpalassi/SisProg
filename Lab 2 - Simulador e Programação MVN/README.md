# Laboratório 2 - MVN 1

## Instruções Iniciais

Para executar o laboratório, siga os passos abaixo:

### Executar o Simulador da MVN

Para rodar o simulador da MVN, a partir da raiz do repositório, você pode iniciar um terminal Python e importar o monitor:

```python
$ python3
>>> from MVN import mvnMonitor
```

Alternativamente, você pode executar diretamente com o comando:

```bash
$ python3 -m MVN.mvnMonitor
```

O monitor da MVN será iniciado, integrando seus códigos ao simulador. Na tela, você verá as opções de comando disponíveis (recomendamos que você gaste algum tempo analisando as funções disponíveis).

## Exercícios

### ex1-soma.mvn

Desenvolva um programa que some os valores das posições de memória 0x010 e 0x012 e armazene o resultado na posição 0x014. As parcelas da soma devem ser -111 e 333 (utilize a representação em complemento de 2).

### ex2-subtracao.mvn

Desenvolva um programa que execute a subtração de dois inteiros em uma sub-rotina. O programa principal deve armazenar os inteiros nas posições 0x010 (variável x) e 0x012 (variável y) e chamar a sub-rotina, que deve executar a operação x - y e armazenar o resultado na posição de memória 0x014.

### ex3-io.mvn

Escrever um programa que lê dois números do teclado (`x` e `y`), e imprime o valor de `x+y`. Observações:

- `0 <= x`, `y <= 99`

- Os números devem ser lidos do teclado, em uma única linha, no formato `<x-d1><x-d2><s><s><y-d1><y-d2>`, onde:

  - `<x-d1>` é o primeiro dígito de x. Se `x < 10`, o dígito informado deve ser `0`.

  - `<x-d2>` é o segundo dígito de `x`.

  - `<s>` é um espaço em branco

  - `<y-d1>` é o primeiro dígito de `y`. Se `y < 10`, o dígito informado deve ser `0`.

  - `<x-d2>` é o segundo dígito de `y`.

Por exemplo, \"07 54\" é uma entrada válida, e o programa deve imprimir \"61\" na saída.

# Dicas:

- Utilize sub-rotinas para a conversão dos dígitos lidos em valores numéricos.

- Consulte o código de exemplo na [seção 5](https://edisciplinas.usp.br/pluginfile.php/7437533/mod_resource/content/1/5-teoria.pdf)
  e [seção 6](https://edisciplinas.usp.br/pluginfile.php/7437534/mod_resource/content/1/6-teoria.pdf) do material teórico.

- Consulte a [tabela ASCII](http://ascii.cl/)
