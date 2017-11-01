# How to Evaluate Clustering

Uma vez que tenhamos os resultados do clustering, temos que saber **o qu�o bom nosso output �**.
Essa avalia��o n�o � espec�fica do K-Means mas serve como base para v�rios outros m�todos.

Em problemas de classifica��o, onde temos os labels, a avalia��o � simples: usamos o algoritmo
de classifica��o em um conjunto de dados de teste e comparamos o resultado predito com os
labels verdadeiros. Assim temos uma escala universal de avalia��o: qual a porcentagem de acerto
do algoritmo de classifica��o? Podemos comparar esse resultado para v�rios algoritmos de classifica��o.

Mas e no clustering, onde n�o temos os labels? Como saber se o clustering � bom ou se esse clustering
� melhor que algum outro?
A avalia��o depender� se temos algum tipo de "verdade basal"
para o clustering, ou n�o.

## Avalia��o do clustering com algum tipo de "verdade basal"

Algumas raras vezes, em clusteriza��o, podemos ter acesso a algum tipo de "verdade basal" para os dados,
mesmo que eles n�o tenham labels, e assim podemos ter uma id�ia da qualidade da clusteriza��o.

Mesmo
nessa situa��o, onde temos acesso a algum tipo de "verdade basal", a avalia��o � dif�cil pois a �nica
coisa que define o clustering � se dois datapoints pertencem ao mesmo cluster ou a cluster diferentes.
Nesse tipo de situa��o algumas medidas podem ajudar a avaliar se o clustering que encontramos
captura a informa��o na "verdade basal" poss�vel que temos:

* �ndice de Rand
* �ndice de Rand Ajustado

Essas medidas contam o n�mero de pares de datapoints que pertencem ao mesmo ou a diferentes clusters
e o mesmo ou diferentes clusters de acordo com a "verdade basal".

Medidas como o �ndice de Rand s�o
chamadas de **avalia��es externas** pois requerem alguma informa��o externa a respeito da
"verdade basal" do clustering.

## Avalia��o do clustering sem nenhum tipo de "verdade basal"

A� o problema � mais dif�cil ainda. Podemos tentar algumas coisas:

* Checar o valor da K-Means Objective Function para diferentes clusterings: isso nos permitir�
comparar 2 ou mais clusterings, mas n�o saberemos se um determinado cluster � ou n�o bom em si mesmo.
Tamb�m pode n�o capturar exatamente o padr�o que estamos realmente tentando achar nos dados.
* Heur�sticas: como estamos sempre tentando encontrar algum padr�o latente significativo, podemos checar:
  * Se a **visualiza��o** do clustering realmente mostra algum padr�o significativo
  * Se os clusters foram um "t�pico" coeso, se eles realmente t�m alguma associa��o significativa
* Usar ferramentas especiais para visualiza��o, como o GGOBI, que nos ajudam a criar visualiza��es
significativas de dados de alta dimensionalidade para avaliar o clustering.

Os m�todos acima s�o basicamente qualitativos, mas podem ser "transformados" em algo mais quantitativo
atrav�s de alguma forma de **crowdsourcing**, por exemplo, Amazon Mechanical Turk. O problema � que isso
pode ser custoso em termos financeiros e de tempo.

Tamb�m existem alguns m�todos de **avalia��es internas** que dependem somente dos dados em quest�o, e
n�o de alguma "verdade basal" externa. Para isso podemos fazer:

* Calcular o **Silhouette Coefficient**
* Dividir o dataset em 2, aplicar o clustering em cada um e comparar os achados do clustering
entre esses dois subconjuntos dos dados.

Tamb�m existem outras formas de avalia��o que s�o muito espec�ficas para um certo dom�nio ou aplica��o
do clustering, e ser�o vistas posteriormente.