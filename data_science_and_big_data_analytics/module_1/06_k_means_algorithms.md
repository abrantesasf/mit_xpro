# The K-Means Algorithm

Lembre-se de que assumimos, no K-Means, que **cada data point é um vetor de valores contínuos**,
e usamos a **distância Euclidiana ao quadrado** como medida de dissimilaridade entre dois datapoints.

O output do K-Means deve ser um conjunto de *clusters centers*, $\mu_1$ até $\mu_K$, e a alocação
de cada datapoint a um, e somente um, cluster, formando um conjunto de datapoints $S_k$ alocado a
cada k cluster.

A idéia geral é que nós queremos minimizar a dissimilaridade dentro de cada cluster, e a dissimilaridade
entre cada datapoint é obtida pela distância Euclidiana ao quadrado. E a dissimilaridade global? Na
realidade temos as seguintes medidas de dissimilaridade:

1. A dissimilaridade entre dois datapoints quaisquer é medida pela distância Euclidiana ao quadrado;
2. A dissimilaridade entre qualquer datapoint e o cluster center é a distância entre esse datapoint
e o cluster center, no caso aqui ilustrado medido pela distâncisa euclidiana
ao quadrado: $\sum{d=1}{D} (X_{n,d} - \mu_{k,d})^2$;
3. A dissimilaridade *dentro* do cluster é a soma de todas as distâncias entre os datapoints desse
cluster e o cluster center: $\sum{n:x_n \in S_k} \sum{d=1}{D} (X_{n,d} - \mu_{k,d})^2$;
4. A dissimilaridade *global* é a soma de todas as dissimilaridades em todos os clusters:
$dis_global = \sum{k=1}{K} \sum{n:x_n \in S_k} \sum{d=1}{D} (X_{n,d} - \mu_{k,d})^2$;

Em resumo: nos calculamos a dissimilaridade global iterando

* Sobre cada cluster;
* Sobre cada datapoint dentro desse cluster; e
* Sobre cada feature de cada datapoint.

O K-Means é um algoritmo que **minimiza a dissimilaridade global**. Essa quantidade é geralmente
chamada de *__K-Means Objective Funcion__*.

O algoritmo do K-Means é o seguinte:

1. Inicializar um número K de cluster centers (aleatoriamente, ou outro método mais sofisticado como
o K-Means++).
2. Alocamos cada datapoint ao ao cluster com o cluster center mais próximo (calculamos a dissimilaridade
entre o datapoint e o cluster center). *Observação:* podemos dividir os datapoints em diferentes núcleos/cores
ou processadores para agizilar o processamento --- isso é chamado embarrassinlgy parallel.
3. Recalculamos os cluster center como sendo a média de todos os datapoints de cada cluster.
4. Repetimos do passo 2 até que os cluster centers não mais possam se mover e/ou até que
a dissimilaridade global não diminua mais.

O K-Means **sempre** termina em um período finito de tempo.