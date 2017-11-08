# Clustering in Graphs and Networks

Também existem situações nas quais nosso dataset não é featurized, por exemplos,
redes sociais. Não temos nenhuma feature de nenhum pessoa, apenas sabemos quais
suas relações com outras pessoas. Existem vários tipos de redes:

- Sociais
- Biológicas
- Computadores
- Dados

Cada datapoint na rede/graph é chamado de NODE, e as conexões são
os EDGES. Os edges também podem ter um peso: quanto maior o peso, mais
forte é a conexão entre esses 2 nodes.

Nosso objetivo aqui é entender a estrutura da rede, por exemplo: existem
grupos mais "densos" de pessoas, que se relacionam muito mais entre si
do que com os demais componentes da rede? Podemos fazer uma clusterização
dessas redes/graphs! E isso é importante pois:

- Cluster em redes sociais afetam como uma epidemia se espalha
- Cluster de proteínas podem ser indicativas da funcionalidade
- Cluster de coautores podem indicar tópicos de pesquisa

## O que é um cluster em um graph?

Intuitivamente um cluster em um graph consiste de nodes que são bem conectados
entre si, ou seja, que têm muitos edges entre si. O número de edges também é
chamado de volume. E o volume por node é a densidade. Nós queremos que os clusters
tenhas alta densidade.

Além disso, entre diferentes clusters não deve haver muitos edges. Essa separação
entre os clusters é medida pelo *cut value*. Esse valor indica quantos edges nós
precisaríamos cortar para desconectar o cluster do resto do graph. Nós queremos
que os clusters tenham um baixo cut value.

Assim, temos que conmbinar o volume/densidade com o cut value para definir os
clusters em nosso graph. Índices que combinam o volume/densidade com o cut value
são, por exemplo:

- Conductance
- Normalized Cut

Esses índices combinados dividem o cut value por uma medida de voluem, e o que
nós queremos é minimizar esse índice.

Em resumo: bons clusters não são muito pequenos, são internamente bem conectados
e separados dos demais nodes.

Uma outra maneira de definir um cluster é pela **matriz de adjacência**, que tem
uma linha e uma coluna para cada node. A célula é 1 se existir um edge entre
os nodes, e 0 se não existir. Os clusters aparecem como "blocos" de 1s na
matriz de adjacência.

Outros flavors de clustering em graphs:

- Medida da modularidade: indicada o quão alta é a densidade de edges dentro de
grupos, comparada com um gráfico de base onde os edges ocorrem ao acaso
- Clusters locais: se o graph é enorme, podemos estar interessados somente
em grupos locais
- Correlation clustering: nós temos informações para pares de pontos, e se são
similares, devem estar no mesmo cluster. Se os nodes devem ficar separados,
desenhamos uma edge negativa (pontilhada) entre os nodes.