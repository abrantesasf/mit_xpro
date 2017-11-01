# Beyond K-Means: What Really Makes a Cluster?

O que ocorre se o output da clusteriza��o n�o � bem o que esper�vamos ou o que quer�amos?
Temos que fazer o "troubleshooting" do K-Means, para torn�-lo melhor!

A primeira coisa a fazer � ter certeza de que estamos obtendo o melhor resultado poss�vel
do algoritmo K-Means. Tendo garantido isso, os problemas mais comuns do K-Means s�o:

1. Demora para terminar: isso raramente ocorre pois K-Means � muito r�pido e sabemos
que K-Means sempre termina (pois os clusters s� se alteram se em cada itera��o diminuirmos
a K-Means Objective Function). Para remediar:
  1. N�o precisamos checar todos os datapoins para descobrir qual � mais pr�ximo do
  cluster center. Isso ocorre devido ao **Triangle Inequality**, que os permite
  ignorar cluster centers que est�o relativamente long de um datapoint.
2. K-Means pode n�o resultadar no menor valor da K-Means Objective Function: isso
ocorre pois o K-Means as vezes nos fornece o "local optimum", mas n�o o "global optimum".
Para remediar:
  1. Rodar o K-Means m�ltiplas vezes, com m�ltiplos valores aleat�rios de inicializa��o
  dos cluster center. Consideramos como "melhor solu��o" o clustering que nos forneceu
  o menor valor da K-Means Objective Function, ou seja, com a menor dissimilaridade global.
  2. Usar inicializa��es inteligentes, como o K-Means++.

Agora imagine que magicamente temos acesso � solu��o "global optimum" do K-Means e, ainda
assim, n�o estamos satisfeitos com o resultado. O que podemos fazer? Nesse caso o problema
*n�o � o algoritmo K-Means*, � o problema do K-Means clustering por si mesmo.