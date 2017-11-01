# The K-Means Algorithm

Lembre-se de que assumimos, no K-Means, que **cada data point � um vetor de valores cont�nuos**,
e usamos a **dist�ncia Euclidiana ao quadrado** como medida de dissimilaridade entre dois datapoints.

O output do K-Means deve ser um conjunto de *clusters centers*, $\mu_1$ at� $\mu_K$, e a aloca��o
de cada datapoint a um, e somente um, cluster, formando um conjunto de datapoints $S_k$ alocado a
cada k cluster.

A id�ia geral � que n�s queremos minimizar a dissimilaridade dentro de cada cluster, e a dissimilaridade
entre cada datapoint � obtida pela dist�ncia Euclidiana ao quadrado. E a dissimilaridade global? Na
realidade temos as seguintes medidas de dissimilaridade:

1. A dissimilaridade entre dois datapoints quaisquer � medida pela dist�ncia Euclidiana ao quadrado;
2. A dissimilaridade entre qualquer datapoint e o cluster center � a dist�ncia entre esse datapoint
e o cluster center, no caso aqui ilustrado medido pela dist�ncisa euclidiana
ao quadrado: $\sum{d=1}{D} (X_{n,d} - \mu_{k,d})^2$;
3. A dissimilaridade *dentro* do cluster � a soma de todas as dist�ncias entre os datapoints desse
cluster e o cluster center: $\sum{n:x_n \in S_k} \sum{d=1}{D} (X_{n,d} - \mu_{k,d})^2$;
4. A dissimilaridade *global* � a soma de todas as dissimilaridades em todos os clusters:
$dis_global = \sum{k=1}{K} \sum{n:x_n \in S_k} \sum{d=1}{D} (X_{n,d} - \mu_{k,d})^2$;

Em resumo: nos calculamos a dissimilaridade global iterando

* Sobre cada cluster;
* Sobre cada datapoint dentro desse cluster; e
* Sobre cada feature de cada datapoint.

O K-Means � um algoritmo que **minimiza a dissimilaridade global**. Essa quantidade � geralmente
chamada de *__K-Means Objective Funcion__*.

O algoritmo do K-Means � o seguinte:

1. Inicializar um n�mero K de cluster centers (aleatoriamente, ou outro m�todo mais sofisticado como
o K-Means++).
2. Alocamos cada datapoint ao ao cluster com o cluster center mais pr�ximo (calculamos a dissimilaridade
entre o datapoint e o cluster center). *Observa��o:* podemos dividir os datapoints em diferentes n�cleos/cores
ou processadores para agizilar o processamento --- isso � chamado embarrassinlgy parallel.
3. Recalculamos os cluster center como sendo a m�dia de todos os datapoints de cada cluster.
4. Repetimos do passo 2 at� que os cluster centers n�o mais possam se mover e/ou at� que
a dissimilaridade global n�o diminua mais.

O K-Means **sempre** termina em um per�odo finito de tempo.