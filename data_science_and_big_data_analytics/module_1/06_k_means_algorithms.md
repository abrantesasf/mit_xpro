# The K-Means Algorithm

Lembre-se de que assumimos, no K-Means, que **cada data point é um vetor de valores contínuos**,
e usamos a **distância Euclidiana ao quadrado** como medida de dissimilaridade entre dois datapoints.

O output do K-Means deve ser um conjunto de *clusters centers*, $\mu_1$ até $\mu_K$, e a alocação
de cada datapoint a um, e somente um, cluster, formando um conjunto de datapoints $S_k$ alocado a
cada k cluster.

A idéia geral do clustering é agrupar os datapoints de acordo com sua similaridade. O K-Means trabalha
minimizando a dissimilaridade dentro de cada cluster.

