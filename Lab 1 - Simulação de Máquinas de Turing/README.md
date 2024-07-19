# Laboratório 1 - Máquinas de Turing

## Instruções Iniciais

Esse repositorio já inclui o simulador e gerador de imagens de maquina de turing, `turingmachine` e `tm_to_dot.rb`, respectivamente.

### Testar um caso:

#### Abra um terminal Python:

```bash
python3
```

#### Importe a biblioteca:

```python
from turingmachine import *
```

#### Carregue sua máquina:

```python
load("submission/sua_maquina.txt")
```

#### Execute um teste:

```python
run("string com fita de entrada")
```

### Rodar o Testador Padrão

#### Abra um terminal Python:

```bash
python3
```

#### Importe a biblioteca:

```python
from turingmachine import *
```

#### Carregue sua máquina:

```python
load("submission/sua_maquina.txt")
```

#### Teste os casos padrão:

```python
run_test("inputs/arquivo_de_teste.in")
```

ATENÇÃO: "sua_maquina.txt" deve ser substituído pelo arquivo que você criou.

Observação: Você pode criar scripts Python para realizar esses passos, economizando tempo e evitando erros de digitação.

## Resolução dos exercícios

Projete e implemente as seguintes Máquinas de Turing. O arquivo da máquina de Turing deve ter um dos seguintes nomes, conforme o exercício:

### mt_soma.txt

Implemente uma Máquina de Turing que calcule a soma `x + y`. Consulte o formato da resposta no arquivo de exemplo `inputs/ex1-soma.in`.

### mt_subtracao.txt

Implemente uma Máquina de Turing que calcule a subtração `x - y`, com `x > y` e tratamento de erros. Consulte o formato da resposta no arquivo de exemplo `inputs/ex2-subtracao.in`.

### mt_soma_binaria.txt

Implemente uma Máquina de Turing que calcule a soma `x + y` em binário, com tamanho máximo de dígitos limitado a 8. Consulte o formato da resposta no arquivo de exemplo `inputs/ex4-soma-binaria.in`.

Observações:

- Nos exercícios 1 e 2, a representação de todos os valores é em unário: 0 = 1, 1 = 11, 2 = 111, etc.

- No exercício 3, a representação de todos os valores é em binário: 0 = 0, 1 = 1, 2 = 10, 3 = 11, etc.

- Todos os exercícios têm exemplos de entrada e saída nos arquivos do diretório `inputs/XXXXX.in` (por exemplo, os exemplos de execução para o exercício 1 estão em `inputs/ex1-soma.in`).

- Tratamento de erros: Sua Máquina de Turing não deve entrar em um loop infinito ao receber entradas inválidas e não deve terminar em um estado de aceitação (estado final). A máquina deve parar em qualquer estado que não seja final (você pode, inclusive, criar um estado específico para casos de erro). O conteúdo da fita não é relevante se a máquina der erro.

## Padrão do Arquivo da Máquina de Turing

Inicie com o prólogo, seguido das ações da máquina:

```ATM
X+Y, soma 2 número unário (formato 1.1)
1 # $         // alfabeto de entrada: $ é o início da fita, # é o separador
1 B # $       // alfabeto da fita: B é branco (default)
1             // número de fitas
1             // número de trilhas na fita 0
2             // fita 0 é infinita nas duas direções
q0            // estado inicial
q6            // estado final
q0 $ q1 $ R   // q0 - início da fita, move para a direita
q1 1 q1 1 R   // q1 - se X tiver um dígito unário válido, move para a direita
q1 # q2 1 R   // q1 - final de X, escreve 1 e move para a direita
q2 1 q2 1 R   // q2 - se Y tiver um dígito unário válido, move para a direita
q2 # q3 B L   // q2 - final de Y, escreve B e move para a esquerda
q3 1 q4 B L   // q3 - último dígito de Y, escreve B e move para a esquerda
q4 1 q5 # L   // q4 - penúltimo dígito de Y, escreve # e move para a esquerda
q5 1 q5 1 L   // q5 - move para esquerda até o inicio da fita
q5 $ q6 $ R   // q5 - início da fita, move para a direita e para
end           // final da máquina
```

Você também pode usar o Turing DataViz modificado para gerar esse formato: [https://guissalustiano.github.io/turing-machine-viz/](https://guissalustiano.github.io/turing-machine-viz/)
