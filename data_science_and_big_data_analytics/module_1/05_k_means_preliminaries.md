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

|             |Feature 1      |Feature 2      |Feature 3      |...|Feature D      |
|-------------|---------------|---------------|---------------|---|---------------|
|X<sub>1</sub>|X<sub>1,1</sub>|X<sub>1,2</sub>|X<sub>1,3</sub>|...|X<sub>1,D</sub>|
|X<sub>2</sub>|X<sub>2,1</sub>|X<sub>2,2</sub>|X<sub>2,3</sub>|...|X<sub>2,D</sub>|
|X<sub>3</sub>|X<sub>3,1</sub>|X<sub>3,2</sub>|X<sub>3,3</sub>|...|X<sub>3,D</sub>|
|...          |...            |...            |...            |...|...            |
|X<sub>N</sub>|X<sub>N,1</sub>|X<sub>N,2</sub>|X<sub>N,3</sub>|...|X<sub>N,D</sub>|