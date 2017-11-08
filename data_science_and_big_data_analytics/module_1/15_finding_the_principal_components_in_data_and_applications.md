# Finding the principal components in data and applications

Um dos métodos mais usados para encontrar grandes padrões nos dados é a
Principal Component Analysis (PCA), que é frequentemente usada quando cada datapoint
contém muitas e muitas featuers e nem todas essas features são significativas,
ou quando existe muita covariância nas medidas.

PCA descreve os dados sumarizando-os em *_padrões típicos_*, que são os
componentes principais.

Cada componente principal é um vetor que "representa" uma combinação
de padrões. Assim a PCA encontra os maiores eixos de variação nos dados, e esses
eixos são nossos padrões.

Os 2 componentes principais tambéms são úteis para visualizarmos dados
graficamente.

## Exemplo com imagens de rostos:

Ao fazer PCA de imagens, tratamos cada imagem como um vetor. Então pegamos as colunas
de pixels e empilhamos umas sobre as outras. Assim podemos encontrar uma "face média"
que é embaçada e fora de foco e, sobre essa "face média", podemos realizar PCA
e encontrar os componentes principais, que parecerão como uma face fantasmagórica.
Esses componentes foram chamados de "Eigen faces".

Cada imagem original é então um overlay desses componentes (eigen faces) com um
determinado coeficiente. Para cada imagem original, precisamos saber apenas os
coeficientes. Isso é útil, por exemplo, para compressão de dados ou para compreender o "espaço"
das imagens de rosto.

## Exemplo genético:

Podemos saber a origem de alguém pelo seu DNA? Se pegarmos 1.400 pessoas e verificarmos
suas variações genéticas através de mais ou menos 200.000 features, é quase impossível.
Mas se calcularmos os coponentes principais dessas variações e plotarmos os dois primeiros
componentes principais, podemos ver claramente que as pessoas foram "clusters" que
correspondem à localizações geográficas.

## Em resumo:

PCA captura grandes padrões, e cada datapoint pode ser expresso por esses componentes.
Esses componentes são as novas features que criamos. Tipicamente poucos componentes são
o suficiente.

Note que reduzimos uma grande quantidade de features para uns poucos componentes principais.
isso é chamado de *_redusão de dimensionalidade_*.