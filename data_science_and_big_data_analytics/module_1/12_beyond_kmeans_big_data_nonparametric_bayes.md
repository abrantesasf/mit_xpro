# Beyond K-Means: Big Data and Nonparametric Bayes

K-Means é um tipo particular de clustering onde assumimos um número K fixo de
clusters, ou seja, assumimos que o número K de clusters é finito. Em algumas
situações isso não é válido.

## Big Data
Big Data sem sempre significa apenas um único dataset enorme, pode significar
uma streaming de dados, onde novos dados são adicionados a todo instante. Por
exemplo:

* 800 novos artigos por dia, só em inglês na Wikipedia
* Usuários interagindo com aplicativos a todo instante do dia
* Espécies descobertas por ano
* Descoberta de novas e desconhecidas populações ancentrais a medida que
estudamos mais e mais DNAs individuais
* A medida que estudamos os nascimentos de bebês, esperamos encontrar
mais e mais problemas de saúde dentre esses bebês
* A medida em que mais e mais pessoas entram nas redes sociais,
esperamos ver novos grupos e interesses representados na rede
* A medida que o número de imagens cresce, no Instagram por exemplo,
esperamos encontrar mais objetos únicos nessas imagens que não foram
vistos nas imagens anteriores.

E o que muda nesse cenário? Em todos esses casos nós não queremos um número
fixo K de clusters. Nós queremos que K possa crescer a medida que o tamanho
do dataset cresce.

Se eu separar 100 artigos da wikipedia, posso clusterizá-los em um certo número
K de clusters de acordo com o assunto dos artigos. Mas se eu ler mais 1000 ou
1.000.000 ou 1.000.000.000 de artigos, certamente o número K de clusters de
assuntos irá aumentar. Assim, *a medida que meu dataset cresce, eu espero que
meu número K de clusters aumente também*. Na realidade queremos que o número
de clusters cresca de acordo com o tamanho de meu dataset.

Nós queremos que *a complexidade do modelo cresca de acordo com o tamanho
do dataset*. Uma solução para esse problema é fornecida através dos
*_Nonparametric Bayesian Methods_*. O termo "não-paramétrica" aqui não indica
falta de parâmetros mas, sim, que temos muitos ou *infinitos* parâmetros. Esses
métodos permitem que o número de parâmetros cresca com o tamanho do dataset.

Esses métodos são mais complexos que o K-Means mas trabalhos recentes sobre
MAD-Bayes nos mostram como transformar métodos bayesianos não paramétricos em
problemas semelhantes aos do K-Means, e algoritmos para clustering em particular,
bem como unsupervised learning em geral.