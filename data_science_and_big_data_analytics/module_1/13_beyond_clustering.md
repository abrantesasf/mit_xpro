# Beyond Clustering

Agora vamos ver casos nos quais técnicas de clustering não servem para
representar os padrões ocultos que queremos encontrar em nossos dados.

Por exemplo: podemos clusterizar imagens de animais? Bem, se cada imagem
só conter um animal, isso é fácil: podemos clusterizar as imagens em grupos
de cachorros, gatos, patos, etc. Mas e se uma foto tiver dois animais diferentes,
por exemplo, um cachorro e um gato? E se a foto não tiver nenhum animal?

O problema com a clusterização é que ela assume que cada datapoint tem que
pertencer a um, e somente, um cluster. Nós podemos expressar alguma incerteza
a respeito de que cluster seria o mais correto, mas na essência ainda acreditamos
que só exista um único grupo que o datapoint pertença.

No problema com as imagens dos animais, as imagens devem pertencer a mais de um
grupo ou a nenhum grupo, ou a apenas 1 grupo, etc., dependendo do que cada imagem
contém. Nesse caso temos:

* Nós chamaos os grupos de *_features_* ao invés de clusters;
* O processo é chamado de *_feature allocation_* ao invés de clusterização.

ATENÇÃO: note que esse é um uso diferente da palavra "feature": até então uma
"feature" era apenas uma característica do datapoint. Agora as "features" são os
grupos a que um determinado datapoint pode pertencer, e o processo é chamado
então de "feature allocation", e não mais de clusterização.

Uma idéia similar é dizer que os datapoints exibem *_mixed membership_*, pois podem
pertencer a multiplos grupos ao mesmo tempo, ao contrário de clustering.

Algumas vezes, clustering é chamado de *_mixture model_* já que a cada vez o ponto vem
de um de vários grupos diferentes. O conjunto de grupos diferentes forma a *mixture*.
Então, nos casos onde cada datapoint pode pertencer a múltiplos grupos ao mesmo tempo
é chamado de *_admixture model_*.

Essencialmente todos esses termos (*_feature allocation_*, *_mixed membership_* e
*_admixture model_*) capturam a idéia de que um datapoint pode pertencer à multiplos
grupos simultaneamente. Isso ocorre em várias situações:

* Um documento de texto pode ser classificado em vários grupos
* Um vídeo pode ser classificado em vários assuntos
* Um DNA pode ser composto de partes de vários grupos ancestrais
* Votos individuais em uma eleição podem representar um grupo de diferentes ideologias políticas
* A interação individual em uma rede social pode representar várias formas de identidades
pessoais, tais como identidade de trabalho, identidade familiar, e identidade social.

Existem vários algoritmos que nos permitem ir além de clustering e capturar a idéia
dessa estrutura de "mixed membership" nos dados, mas o mais comum desses algoritmos
é o *_Latent Dirichlet Allocation (LDA)_*.

O LDA foi originalmente programado para dados textuais, e sua popularidade pode ser devida
à quantidade massiva de textos disponíveis para análise. Mas o LDA pode ser aplicado
para outros tipos de dados categóricos, inclusive genéticos.

Outros algoritmos parecidos com o K-Means para esse tipo de feature allocation em
múltiplos grupos foram derivados a partir do MAD-Bayes, e incluem: *_DP-Means_* e
*_BP-Means_* (usados principalmente no estudo de tumores, onde múltiplos diferentes
tipos de cânceres podem estar presentes, e saber quais desses cânceres estão presentes
é importante para determinar um tratamento).