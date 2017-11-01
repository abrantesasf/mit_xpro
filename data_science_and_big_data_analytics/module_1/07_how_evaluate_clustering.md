# How to Evaluate Clustering

Uma vez que tenhamos os resultados do clustering, temos que saber **o quão bom nosso output é**.
Essa avaliação não é específica do K-Means mas serve como base para vários outros métodos.

Em problemas de classificação, onde temos os labels, a avaliação é simples: usamos o algoritmo
de classificação em um conjunto de dados de teste e comparamos o resultado predito com os
labels verdadeiros. Assim temos uma escala universal de avaliação: qual a porcentagem de acerto
do algoritmo de classificação? Podemos comparar esse resultado para vários algoritmos de classificação.

Mas e no clustering, onde não temos os labels? Como saber se o clustering é bom ou se esse clustering
é melhor que algum outro?
A avaliação dependerá se temos algum tipo de "verdade basal"
para o clustering, ou não.

## Avaliação do clustering com algum tipo de "verdade basal"

Algumas raras vezes, em clusterização, podemos ter acesso a algum tipo de "verdade basal" para os dados,
mesmo que eles não tenham labels, e assim podemos ter uma idéia da qualidade da clusterização.

Mesmo
nessa situação, onde temos acesso a algum tipo de "verdade basal", a avaliação é difícil pois a única
coisa que define o clustering é se dois datapoints pertencem ao mesmo cluster ou a cluster diferentes.
Nesse tipo de situação algumas medidas podem ajudar a avaliar se o clustering que encontramos
captura a informação na "verdade basal" possível que temos:

* Índice de Rand
* Índice de Rand Ajustado

Essas medidas contam o número de pares de datapoints que pertencem ao mesmo ou a diferentes clusters
e o mesmo ou diferentes clusters de acordo com a "verdade basal".

Medidas como o Índice de Rand são
chamadas de **avaliações externas** pois requerem alguma informação externa a respeito da
"verdade basal" do clustering.

## Avaliação do clustering sem nenhum tipo de "verdade basal"

Aí o problema é mais difícil ainda. Podemos tentar algumas coisas:

* Checar o valor da K-Means Objective Function para diferentes clusterings: isso nos permitirá
comparar 2 ou mais clusterings, mas não saberemos se um determinado cluster é ou não bom em si mesmo.
Também pode não capturar exatamente o padrão que estamos realmente tentando achar nos dados.
* Heurísticas: como estamos sempre tentando encontrar algum padrão latente significativo, podemos checar:
  * Se a **visualização** do clustering realmente mostra algum padrão significativo
  * Se os clusters foram um "tópico" coeso, se eles realmente têm alguma associação significativa
* Usar ferramentas especiais para visualização, como o GGOBI, que nos ajudam a criar visualizações
significativas de dados de alta dimensionalidade para avaliar o clustering.

Os métodos acima são basicamente qualitativos, mas podem ser "transformados" em algo mais quantitativo
através de alguma forma de **crowdsourcing**, por exemplo, Amazon Mechanical Turk. O problema é que isso
pode ser custoso em termos financeiros e de tempo.

Também existem alguns métodos de **avaliações internas** que dependem somente dos dados em questão, e
não de alguma "verdade basal" externa. Para isso podemos fazer:

* Calcular o **Silhouette Coefficient**
* Dividir o dataset em 2, aplicar o clustering em cada um e comparar os achados do clustering
entre esses dois subconjuntos dos dados.

Também existem outras formas de avaliação que são muito específicas para um certo domínio ou aplicação
do clustering, e serão vistas posteriormente.