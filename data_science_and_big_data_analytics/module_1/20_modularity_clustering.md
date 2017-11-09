# Modularity Clustering

Um dos pressupostos do spectral clustering é que temos que especificar o número
K de clusters (geralmente utilizando um número K de eigenvectors). Existe um método
que nos permite encontrar os clusters em uma rede/graph onde não é necessária a
definição a priori do número K de clusters: esse método é o **Modularity Clustering**.

No *Modularity Clustering* nós especificamos um *escore de modularidade* que queremos
maximizar. A idéia é comparar as comunidades (clusters) com um graph aleatório basal
que compartilha algumas características com o graph real, tais como o número de edges e,
grosseiramente, o degree de cada node.

Comunidades (clusters) devem ter muitos mais edges em seu interior do que o esperado
pelo graph basal.

## Como executar a modularity clustering?

Como exemplo, imagine que temos 2 comunidades candidatas. Como medimos o desvio dessas
comunidades com o graph basal aleatório? Nós calculamos o número de edges dentro da
comunidade e então subtraímos o número esperado de edges conforme o graph basal. Concretamente
temos o seguinte:

- Para cada par de nodes, *i* e *j*, contamos todos os Aij menos a Pij, onde:
  - Aij = indica um edge que é 1 se i e j estiverem conectados e 0 caso contrário
  - Pij = probabilidade de edges entre i e j no graph basal
- Somamos todos os Aij - Pij, de todos os pares de nodes
- Calculamos o escore de modularidade como a soma dessas diferenças
na mesma comunidade, somado ao de outras comunidades

Em resumo: **(# de edges na comunidade 1 - # de edges esperados)
+ (# de edges da comunidade 2 - # de edges esperados)**. Esse é o escore de modularidade.
Se ele é *grande*, as comunidades são bem densas. O exemplo foi só com 2 comunidades,
mas o cálculo é generalizado para um número arbitrário de comunidades.

## Como calcular o graph basal aleatório esperado?

Existem várias maneiras de calcular mas a mais comum é a seguinte: o número esperado
de edges entre os nodes *i* e *j* é proporcional ao degree de i vezes o degree de j.

Pij = (degree(i) x degree(j)) / (2 x total # edges)

Assim, nodes com edges em nosso graph são esperados a ter muitos edges na graph basal.

## Interpretação:

A idéia de modularidade é que um conjunto arbitrário de nodes podem ter tantas conexões
quanto o esperado pelo graph basal. Nesse caso a modularidade é próxima de zero e as
comunidades não têm significado, ou seja, não são comunidades separadas (clusters).

Mas se a modularidade é alta, temos muitos edges dentro das comunidades e poucos
entre as comunidades.

A moduralidade também pode ser negativa, quando o número de edges em nossa comunidade
é menor do que o esperado pelo graph basal. Isso ocorre, por exemplo, em coleções de
textos, onde verbos e substantivos tendem a co-ocorrer, mas não 2 verbos e 2 substantivos.
Assim, essa modularidade negativa separaria verbos e substantivos.

## Como saber se achamos um bom particionamento?

Podemos tentar todas as possibilidades, mas isso seria impraticável em termos de tempo.

Outra abordagem é começar com algum particionamento e então mover os nodes entre os grupos
para ver se isso aumenta o escore de modularidade.

Ou podemos usar os eigenvectors! Dessa vez usamos uma matriz semelhante à matriz de adjacência
e à matria Laplacian, mas um pouco diferente. As células dessa nova matriz são preenchidas
com a diferença entre Aij - Pij.

Com essa matriz de diferenças Aij - Pij montada, calculamos os eigenvectors. Os eigenvectors
alocam um valor para cada node, e usamos os eigenvectors com os maiores valores de eigenvalues.
No exemplo de 2 comunidades, colocamos todos os nodes com valores positivos em uma comunidade,
e todos os nodes com valores negativos em outra comunidade. Esse processo pode ser extendido para
mais eigenvector e mais comunidades.

O valor dado pelo eigenvector mostra quão importante ou central um node é para a comunidade.

ATENÇÃO: os eigenvalues no caso da modularity clustering pode ser negativo! Isso significa
que o eigenvector associado fornece um valor ao node que leva à baixa modularidade.

## Exemplo famoso de modularity clustering:

Zachary's Karate Club.