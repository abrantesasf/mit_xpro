# Beyond K-Means: Data and Pre-Processing

Antes de rodar o K-Means nos dados, temos algumas questões a considerar.

## Os dados são featurized?

Lembre-se de que o K-Means precisa de um **vetor de dados**. Então a primeira coisa que
temos que saber é se todos esses dados podem ser tranformados em um vetor ordenado.
Cada entrada no vetor terá um significado. Se os dados estão organizados em
vetores ordenados (linhas representam diferentes observações e colunas representam
diferentes features), os dados estão featurized.

## Todas as features são números contínuos?

Se alguma feature não for, pode ser transformada? Por exemplo, o grau de educação
pode ser transformado em anos de estudo?

## Todos os números são "proporcionais" em termos de escala?

Como o K-Means pressupõe clusters esféricos e de mesmo tamanho, se a escala
de expressão de cada feature for muito diferente, causará uma distorção na forma
do cluster. Nesse caso devemos utilizar uma forma de **normalização** ou **padronização**
da escala dos dados:

* Entre -1 e 1
* Entre 0 e 1
* Escores-z

## Existem muitas features?

Verifique se não existem features inúteis ao propósito da clusterização. Se for
possível, com o conhecimento do domínio, elimiar algumas features, faça. Caso não seja
possível, podemos usar algumas técnicas como:

* Principal Component Analysis (PCA)

## Existe alguma razão domínio-específica para alterar as features?

Se existir conhecimento acerta do domínio específico do problema da clusterização e
se houver alguma razão para alterar as features, retire as features inúteis (com seu
conhecimento ou de algum especialista).

**ATENÇÃO**: qualquer alteração nas features guiada por conhecimento a respeito do
domínio, deve ser feita *antes da PCA ou do K-Means*.

Também devemos considerar a retirada de features que não cumprem os pressupostos do K-Means.