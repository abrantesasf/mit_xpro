# Embeddings and Components

Já vimos que tanto a PCA, quanto os spectral embeddings e spectral clustering
encontram novas features vectors para os datapoints, em outras palavras,
um embedding.

Os embedding são tão úteis que vamos sumarizar seu uso.

- Usamos embeddings para redução de dimensionalidade.
  - Embeddings com 2 dimensões são úteis para visualizarmos gráficos, notícias,
  preferências pessoais, tendências globais.
- No spectral clustering, K-Means nos dá melhores resultados após a realização
de spectral embedding.
- Embeddings podem nos dar componentes importantes ou temas, na PCA.

Agora temos que fazer uma DISTINÇÃO entre PCA e **spectrograph embeddings**:
- Na PCA cada datapoint podia ser escrito como uma combinação ponderada de componentes.
Tal embedding é dito *linear*.
- No spectral clustering, primeiro nós construímos um graph e depois disso calculamos
os eigenvectors. Essa representação é *não linear*.

## Outros métodos

Esse objetivo de features com poucas dimensões mas que preservam as relações entre os
pares é compartilhado por outros métodos. Por exemplo, algumas vezes temos informações
disponíveis que nos ajudam a guiar o processo de embedding (escrita de números à mão, por
exemplo). Esse tipo de método é chamado de **Metric Learning**!

Metric Learning é um método que usa informação externa para ajudar a guiar o embedding.

Outro método é o **Independent Component Analysis (ICA)**, que nos fornece componentes
que são estatisticamente independentes, ou seja: não têm informação sobre os outros. Isso
é mais forte do que a diferença entre componentes da PCA. Por exemplo: uma gravação com um
home falando e um cachorro latindo: ICA pode ser usado para separar essas diferentes fontes
sonoras.

Outro método é o **Dictionary Learning**, que coloca constraints nas associações entre
os datapoints. Cada datapoint pode estar associado com apenas alguns poucos componentes.
Nesse caso nós podemos precisar de muitos componentes, assim nós podemos não reduzir
a dimensionalidade, mas obtemos um dicionário que pode ser usado, por exemplo,
para reconstruir imagens.

Outro método é a Singular Value Decomposition (SVD). É um método similar à PCA e
também nos fornece os componentes principais. A SVD reescreve nossa matriz de dados
como um produto de 3 matrizes: "U", "Sigma" e "V transposta". Detalhes:

- A matriz Sigma é zero, exceto pela diagonal. O quadrado dos valores dessa diagonal
são os eigenvalues que obtemos na PCA.
- Os componentes principais da matriz V são os eigenvectors da PCA, e são chamados
de Right Singular Vectors. As colunas da matriz são os Left Singular Vectors.

Essas 3 matrizes descrevem nossos dados através de "temas". Para cada tema nós temos:
um singular value, um left e um rigth singular vector. O singular value nos informa
a importância do tema (quanto maior, mais importante). O right singular vector mostra
a associação entre as features e o tema. O left singular vector nos mostra a
preferência particular de uma observação por um tema.

Assim, com o SVD, podemos entender simultaneamente os temas e as características.

As entradas nos left singular vectors multiplicadas pelos respectivos singular values,
são exatamente as coordenadas que usamos para visualizar os dados.

## Resumindo:

Embeddings são muito bons para:

1. Fornecer redução de dimensionalidade
2. Mostrar padrões ocultos nos dados
3. Ajudar a compreender os dados através de grandes padrões, componentes ou temas.