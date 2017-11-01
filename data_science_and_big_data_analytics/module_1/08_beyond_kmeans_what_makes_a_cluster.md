# Beyond K-Means: What Really Makes a Cluster?

O que ocorre se o output da clusterização não é bem o que esperávamos ou o que queríamos?
Temos que fazer o "troubleshooting" do K-Means, para torná-lo melhor!

A primeira coisa a fazer é ter certeza de que estamos obtendo o melhor resultado possível
do algoritmo K-Means. Tendo garantido isso, os problemas mais comuns do K-Means são:

1. Demora para terminar: isso raramente ocorre pois K-Means é muito rápido e sabemos
que K-Means sempre termina (pois os clusters só se alteram se em cada iteração diminuirmos
a K-Means Objective Function). Para remediar:
  1. Não precisamos checar todos os datapoins para descobrir qual é mais próximo do
  cluster center. Isso ocorre devido ao **Triangle Inequality**, que os permite
  ignorar cluster centers que estão relativamente long de um datapoint.
2. K-Means pode não resultadar no menor valor da K-Means Objective Function: isso
ocorre pois o K-Means as vezes nos fornece o "local optimum", mas não o "global optimum".
Para remediar:
  1. Rodar o K-Means múltiplas vezes, com múltiplos valores aleatórios de inicialização
  dos cluster center. Consideramos como "melhor solução" o clustering que nos forneceu
  o menor valor da K-Means Objective Function, ou seja, com a menor dissimilaridade global.
  2. Usar inicializações inteligentes, como o K-Means++.

Agora imagine que magicamente temos acesso à solução "global optimum" do K-Means e, ainda
assim, não estamos satisfeitos com o resultado. O que podemos fazer? Nesse caso o problema
*não é o algoritmo K-Means*, é o problema do K-Means clustering por si mesmo.