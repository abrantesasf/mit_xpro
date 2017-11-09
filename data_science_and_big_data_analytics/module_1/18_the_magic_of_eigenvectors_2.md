# The magic of Eigenvectors: 2

Para calcularmos os clusters em uma rede/graph, temos que nos atentar à estrutura
de **Global Connectivity** do graph. E para capturar essa estrutura, novamente
os eigenvector são a chave, pois eles guardam uma grande quantidade de informações
sobre a estrutura do graph.

Os métodos para a clusterização de redes/graphs são chamados de **Métodos Spectrais**,
como a **Spectral Clustering**. E onde entram os eigenvectors nesses métodos spectrais?
O *spectrum* da matriz é o conjunto de eigenvectors!

E como construir uma matriz de um graph? A matriz é o **Laplacian** do graph!

## Laplacian de um graph

Para construir o Laplacian de um graph, contamos quantos nodes têm o graph e criamos
uma matriz N x N, onde N = número de nodes. Cada célula ixj corresponde a um edge
potencial entre os nodes i e j. Essa matriz Laplacian é preenchida então do seguinte modo:

1. Se as células não são da diagonal:
  - Se há um edge entre as células ixj, a célula é preenchida com -1
  - Se não há um edge entre as células ixj, a célula é preenchida com 0
2. Se as células são da diagonal:
  - A célula é preenchida com o *grau* do node, sendo que esse grau corresponde
  à quantidade de edges que partem/chegam nesse node.

Essa matriz Laplacian pode ser normalizada dividindo-se os valores pelos degrees ou pela
raiz quadrada dos degrees.

## Eigenvectors da Laplacian

Suponha que temos a seguinte Matriz Laplacian:

```r
a <- c(2, -1, -1, 0, 0, 0)
b <- c(-1, 2, -1, 0, 0, 0)
c <- c(-1, -1, 3, -1, 0, 0)
d <- c(0, 0, -1, 3, -1, -1)
e <- c(0, 0, 0, -1, 2, -1)
f <- c(0, 0, 0, -1, -1, 2)

laplacian <- rbind(a, b, c, d, e, f)
colnames(laplacian) <- c("a", "b", "c", "d", "e", "f")
laplacian
   a  b  c  d  e  f
a  2 -1 -1  0  0  0
b -1  2 -1  0  0  0
c -1 -1  3 -1  0  0
d  0  0 -1  3 -1 -1
e  0  0  0 -1  2 -1
f  0  0  0 -1 -1  2
```

Os eigenvectors e eigenvalues são os seguintes:

```r
eigen(laplacian)
eigen() decomposition
$values
[1] 4.561553e+00 3.000000e+00 3.000000e+00 3.000000e+00 4.384472e-01 4.872645e-16

$vectors
           [,1]       [,2]        [,3]       [,4]       [,5]       [,6]
[1,]  0.1845241  0.0000000  0.00000000  0.7637626  0.4647051 -0.4082483
[2,]  0.1845241  0.1985167 -0.49629167 -0.5455447  0.4647051 -0.4082483
[3,] -0.6571923 -0.1985167  0.49629167 -0.2182179  0.2609565 -0.4082483
[4,]  0.6571923 -0.1985167  0.49629167 -0.2182179 -0.2609565 -0.4082483
[5,] -0.1845241 -0.5572738 -0.51075870  0.1091089 -0.4647051 -0.4082483
[6,] -0.1845241  0.7557905  0.01446703  0.1091089 -0.4647051 -0.4082483
```

Ordene os eigenvectors em ordem crescente de eigenvalues e teremos o seguinte:

1. O menor eigenvalue é sempre 0 (4,87e-16). O número de eigenvalues 0 é exatamente
o número de partes desconectadas do graph. Essas partes são chamadas de **componentes conectados**.
2. O próximo menor eigenvalue que não seja 0 é interessante. Seu eigenvector terá N elementos,
igual ao número N de nodes, e os valores dos elementos do eigenvector refletem o
vetor do graph! Podemos colorir os nós de acordo os valores: nodes com valores próximos têm
a mesma cor. Podemos até estabelecer um limite a partir do qual os nodes serão classificados
em outro grupo.
3. Os próximos eigenvalues/eigenvectors complementam a informação dos clusters! Utilizando
os próximos eigenvalues/eigenvectors, podemos refinar a estrutura de clustering do graph.

## Embedding

Os eigenvectors pode fazer mais ainda para o graph! Lembre-se de que em uma rede/graph, os
nodes não tem features, não tem vetores com features.

Mas agora, com os eigenvectors, nós podemos *dar a cada node um vetor de features*! Repare
na estrutura dos eigenvectors:

```
$vectors
           [,1]       [,2]        [,3]       [,4]       [,5]       [,6]
[1,]  0.1845241  0.0000000  0.00000000  0.7637626  0.4647051 -0.4082483
[2,]  0.1845241  0.1985167 -0.49629167 -0.5455447  0.4647051 -0.4082483
[3,] -0.6571923 -0.1985167  0.49629167 -0.2182179  0.2609565 -0.4082483
[4,]  0.6571923 -0.1985167  0.49629167 -0.2182179 -0.2609565 -0.4082483
[5,] -0.1845241 -0.5572738 -0.51075870  0.1091089 -0.4647051 -0.4082483
[6,] -0.1845241  0.7557905  0.01446703  0.1091089 -0.4647051 -0.4082483
```

A primeira linha corresponde ao novo feature vector para o primeiro node! Essa
maneira de *criar* vetores de features é chamada de **embedding*.

Na PCA também temos embedding: lá usamos os eigenvectors com os maiores valores.
Aqui nos graphs, os eigenvectors com os menores valores é que são importantes.

## Plotando a estrutura do graph

De modo semelhante à plotar os componentes principais da PCA, aqui nos graphs
podemos usar os eigenvectors com os menores eigenvalues que não sejam 0 como
coordenadas para os nodes, e plotar um gráfico! Os nodes que são conectados
são posicionados próximos uns aos outros no plano. O embedding aqui
pretende minimizar o comprimento dos edges.

Se usarmos os eigenvectors com os maiores eigenvalues, teremos o efeito oposto:
maximizaremos o comprimento dos edges na plotagem, e os nodes conectados serão colocados
uns distantes dos outros.

Ao plotarmos com os menores ou com o maiores eigenvectors, estamos plotando
a mesma informação, mas de forma diferente e por isso os plots parecem
tão diferentes. A explicação para isso é que os eigenvectors minimizam ou maximizam
um score de diferença.

## Em resumo

Os eigenvectors e os eigenvalues contém muitas informações sobre a estrutura do graph,
e são assim muito úteis para o clustering de redes/graphs.

De fato eles contém ainda mais informações sobre o número de paths entre 2 nodes ou sobre
a importância dos nodes e edges.