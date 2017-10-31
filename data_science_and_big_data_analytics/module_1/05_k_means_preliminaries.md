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

|    |Feature 1|Feature 2|Feature 3|...|Feature D|
|----|---------|---------|---------|---|---------|
|X~1~|X~1,1~   |X~1,2~   |X~1,3~   |...|X~1,D~   |
|X~2~|X~2,1~   |X~2,2~   |X~2,3~   |...|X~2,D~   |
|X~3~|X~3,1~   |X~3,2~   |X~3,3~   |...|X~3,D~   |
|... |...      |...      |...      |...|...      |
|X~N~|X~N,1~   |X~N,2~   |X~N,3~   |...|X~N,D~   |