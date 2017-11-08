# The magic of eigenvectors: 1

Já vimos que na PCA queremos encontrar os padrões principais e, tipicamente,
esses padrões não afetam uma única feature: ao contrário, esses padrões
principais afetam muitas features ao mesmo tempo.

Quando temos muitas features, elas *vão em uma direção ou em outra direção
governadas por algum fator latente não conhecido*. Esse "movimento" conjunto
das features é a covariância: elas co-variam a partir de uma média. O que
nós queremos fazer é *achar as maiores direções da covariância a partir
da média*.

Para isso utilizamos a matriz de covariância dos dados. E os componentes
principais são os eigenvectors dessa matriz.

Um exemplo em R:

```r
anne <- c(20, 4, 16, 0)
bill <- c(10, 2, 18, 10)
chris <- c(13, 1, 19, 7)
jen <- c(1, 13, 7, 19)
joe <- c(18, 10, 10, 2)
maggie <- c(4, 20, 0, 16)
matriz <- rbind(anne, bill, chris, jen, joe, maggie)
colnames(matriz) <- c("alpine", "himalaya", "hawaii", "scuba")
```

Para construir a matriz de covariância, calculamos a média de cada feature,
e depois calculamos o quando cada observação desvia-se da média:

```r
medias <- apply(matriz, 2, mean)
desvios <- sweep(matriz, 2, medias)
```

A covariância de duas localizações, por exemplo Himalaya e Hawaii, mede
quanto os valores variam na mesma direção: se variam na mesma direção,
a covariância é positiva, se variam em direções opostas, a covariância é
negativa.

Para calcular a covariância entre duas localizações, para cada datapoint (cada pessoa
no exemplo em R)
multiplicamos o desvio para essas localizações. A soma das covariâncias de todas
as pessoas é a covariância entre essas duas localizações. Assim a matriz
de covariância é uma matriz com N-Features x N-Features. No R:

```r
cov(matriz)
```

Os componentes principais que estamos procurando são os eigenvectors dessa matriz
de covariância! Os eigenvectors são definidos matematicamente pelo produto da
matriz de covariância e um vetor, resultando em outro vetor. Esse vetor
resultante tem um magnitude e direção no espaço N-Feature (N-dimensional). Se esse vetor
resultando sofrer uma alteração na magnitude e na direação, não é um eigenvector;
Se o vetor
resultante sofrer uma alteração na magnitude, mas não na direção, é um eigenvector.

```r
eigen(matriz
```

```
Exemplo que não é eingenvector:

 Matriz     Vetor     Vetor resultado NÃO É Eigenvector:
                            pois há mudança de magnitude e direção
6  2  3       1       11
2  0  1   x   1   =    3
3  1  2       1        6



Exemplo que é eigenvector:

 Matriz     Vetor     Eigenvalue      Eigenvector
                                      pois há somente mudança de magnitude
6  2  3       .85                    .85
2  0  1   x   .26 =          8.2  x  .26
3  1  2       .45                    .45
```

Note que a alteração da magnitude ocorreu pelo valor de eigenvalue, mas
a direção do vetor (.85, .26, .45) permaneceu a mesma. O eigenvalue é assim
a quantidade pelo qual o eigenvector sofreu alteração em sua magnitude. Note
também que todo eigenvector tem um eigenvalue.

Note, por fim, que os eigenvectors capturam as direções globais que são inerentes
à matriz de covariância, e quanto maior o eivenvalue, mais importante o eigenvector é.
Por isso, os eigenvector com os maiores eigenvalues são os componentes principais!

Matematicamente isso é dado por:

**Matriz _x_ Eigenvector = Eigenvalue _x_ Eigenvector**

Uma questão imporante: quantos componentes principais nós precisamos? Alguns já podem
bastar e o resto podem ser mais ruído do que coisas realmente importantes. Assim, olhamos os
eigenvalues e ordenamos em ordem decrescente: geralmente há um grande gap após o qual todos
os eivengalues são pequenos. Nós pegamos os eigenvectors maiores e ignoramos esse resto.

LIMITAÇÃO DA PCA: só captura relações lineares entre as features!