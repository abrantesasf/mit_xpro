# Beyon K-Means: other notions of distance

Clustering é agrupar os dados de acordo com sua similaridade. Estudaremos agora as diferentes
noções de agrupamento.

## Número K de clusters:

Um dos principais problemas do K-Means é que o usuário precisa especificar o número de clusters K.
Algumas vezes isso é totalmente possível de modo razoavelmente fácil. Por exemplo, quando queremos
comprimir uma imagem, aumentar o número de clusters K aumenta a qualidade da imagem.

Mas outras vezes isso é difícil. Algums métodos para determinar o número de clusters, usando
heurísticas populares:

1. Gráfico de cotovelo: plotamos a dissimilaridade global x o número de clusters. Não existe um
valor exato para K, pois a K-Means Objective Function sempre diminui quando o número de clusters
aumenta (no limite, a dissimilaridade é a menor possível quando K = N, mas isso é inútil). Nesse
caso procuramos o "cotovelo" do gráfico, onde o ganho na diminuição da dissimilaridade global torna-se
menor.
2. Gap Statistic
3. Mudança na K-Means Objective Function, para levar em conta que pagamos um "preço" maior por
modelos mais complexos. Começamos com a K-Means Objective Function original e adicionamos um
termo de *penalidade* que cresce com o número de parâmetros. Essa penalidade é dada por
AIC, BIC ou outro *information criteria*.

Mesmo assim existem situações onde é difícil determinar o número K. Por exemplo, no estudo biológico
de organismos, um número alto de K pode ser útil para separar espécies; se diminuirmos o número K, podemos
separar gêneros, famílias ou ordens. Nesse caso, tanto um grande número de clusters, separando as espécies,
quanto um número menor de clusters separando os gêneros ou famílias, trazem insights e informações úteis.
Nesse tipo de situação pode ser útil tentar uma abordagem de clustering hierárquica, **Hierarchical Clustering**,
como o *agglomerative clustering*, que modelam clusters que podem ser compostos de outros sub-clusters.

## Hard x Soft clustering

Em todos os exemplos até agora, cada datapoint era alocado a um, e apenas um, cluster. Isso é chamado
de **hard clustering**. Mas existem situações nas quais os clusters não são perfeitamente separados. Alguns
datapoints podem estar na borda entre os clusters e podemos não ter certeza de a qual cluster esse ponto
pertence.

Para expressarmos essa incerteza com o **soft clustering**, que permite que cada datapoint tenha um diferente
grau de "membership" em cada cluster, um diferente grau de probabilidade de pertencer a cada cluster. Os principais
métodos de soft clustering são:

* Fuzzy Clustering
* Mixture Models
  * Gaussian Mixture Models