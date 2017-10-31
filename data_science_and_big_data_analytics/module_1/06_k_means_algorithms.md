# The K-Means Algorithm

Lembre-se de que assumimos, no K-Means, que **cada data point � um vetor de valores cont�nuos**,
e usamos a **dist�ncia Euclidiana ao quadrado** como medida de dissimilaridade entre dois datapoints.

O output do K-Means deve ser um conjunto de *clusters centers*, $\mu_1$ at� $\mu_K$, e a aloca��o
de cada datapoint a um, e somente um, cluster, formando um conjunto de datapoints $S_k$ alocado a
cada k cluster.

A id�ia geral do clustering � agrupar os datapoints de acordo com sua similaridade. O K-Means trabalha
minimizando a dissimilaridade dentro de cada cluster.

