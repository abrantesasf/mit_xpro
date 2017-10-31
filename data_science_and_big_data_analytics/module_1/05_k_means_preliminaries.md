# K-Means Prelimiaries

K-Means é o algoritmo mais popular para clustering (e talvez o mais popular dentre todos os algoritmos de unsupervised learning).

São 5 as principais vantagens do K-Means:
* É **rápido** para executar
* O algoritmo é composto de **passos simples**
* Pode ser executado em **paralelo** (computação paralela), simultaneamente em múltiplos cores ou processadores
* É rápido de **programar** e **entender**
* Apresenta **poucos parâmetros** para serem ajustados, ao contrário de outros algoritmos

## Pressupostos do K-Means:
1. Todos os datapoints devem ser expressos como uma lista ou vetor de **valores contínuos**
2. Teremos N datapoints, em D dimensões (D features)
3. Similaridade é medida através da dissimilaridade entre os pontos, ou seja, pela distância entre
os datapoints. Essa distância pode ser medida por diversas formas, mas a mais comum é a
**Distância Euclidiana**. E particularmente calculamos o **quadrado** da distância Euclidiana. Assim,
a distância entre dois datapoints é a soma da distância euclidiana entre esses pontos:
$dis(a,b, \cdots, z) = \sum_{d=1}^{D} \left ( A_d - B_d - \cdots - Z_d\right )^2$
4. Nós esperamos um número *K* de clusters, a priori, ou seja: temos que ter uma estimativa a priori
do número de clusters K para alocar os datapoints. As vezes não sabemos esse número de cluster K a priori
(existem métodos para determinar isso), mas o K-Means assume que você sabe esse número K de cluster a priori.
5. É possível obter um *cluster center* para cada cluster, denominado por $\mu_k$, e o conjunto de dados
alocado a cada ponto ($S_k$).

|             |Feature 1      |Feature 2      |Feature 3      |...|Feature D      |
|-------------|---------------|---------------|---------------|---|---------------|
|X<sub>1</sub>|X<sub>1,1</sub>|X<sub>1,2</sub>|X<sub>1,3</sub>|...|X<sub>1,D</sub>|
|X<sub>2</sub>|X<sub>2,1</sub>|X<sub>2,2</sub>|X<sub>2,3</sub>|...|X<sub>2,D</sub>|
|X<sub>3</sub>|X<sub>3,1</sub>|X<sub>3,2</sub>|X<sub>3,3</sub>|...|X<sub>3,D</sub>|
|...          |...            |...            |...            |...|...            |
|X<sub>N</sub>|X<sub>N,1</sub>|X<sub>N,2</sub>|X<sub>N,3</sub>|...|X<sub>N,D</sub>|