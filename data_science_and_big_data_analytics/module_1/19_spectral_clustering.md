# Spectral Clustering

Já vimos que podemos usar eigenvectors para compreender a estrutura de uma
rede ou graph e determinar os grupos existentes nessa rede. Mas como exatamente
fazer isso, como realizar um spectral clustering?

De modo geral o spectral clustering funciona da seguinte forma:

1. Primeiro, construímos a matriz de adjacência onde, para cada nó, colocamos o valor
1 se houver um edge entre esses nós, e o valor 0 se não há edges.
2. A partir da matriz de adjacência podemos construir a matriz Laplacian, colocando
a soma de uma linha na diagonal e multiplicando os outros números por -1 (negativando
os números). Tanto a matriz de adjacência quanto a matriz Laplacian terão a mesma estrutura, só
os números um pouco diferentes.
3. Calculamos os eigenvectors. Em um graph/rede real, temos que descobrir como encontrar os blocos, os "grupos"
de nós. Como descobrir isso? Temos que olhar para os eigenvectors! Eles indicam
a estrutura "em bloco" existente e, para isso, só consideramos os eigenvectors mais "baixos", os de
menor eigenvalues.
4. Esses eigenvectors "mais baixos" criam novas featuers, um embedding.
5. Usamos o K-Means nessas novas features criadas por embedding! Para acharmos K clusters,
temos que usar K eigenvectors!
6. Se o graph é completamente conectado, existe um Bohring-Eigenvector "global", que descartamos
imediatamente, e ficamos só com os outros para definir os clusters.

O spectral clustering é amplamente utilizado até mesmo para dados que não são rede/graphs,
por exemplo, para determinar clusters em dados não esféricos (que é um pressuposto do K-Means).
Imagine um estrutura onde os clusters são curvos: K-Means não consegue captar essa informação.
Nessa situação podemos traduzir nossos datapoints em um graph, concretamente construindo um
graph/rede a partir dos dados. Para cada datpoint nós criamos um node e conectamos esse node
aos mais próximos ou similares. Assim o graph agora reflete as relações locais entre os datapoints.
A partir desse graph construído, fazemos nosso spectral clustering. E o resultado é que agora
os clusters seguem a forma dos dados.

Esse graph criado a partir dos dados é chamado de **neighborhood graph**.

Um ponto de atenção ao criar os *neighborhood graph*: um edge entre dois nodes é ponderado
pela similaridade dos pontos. E temos que conectar esses nodes a um número de outros nodes
próximos. A questão é: a quantos outros nodes temos que conectar o node atual? Não podem
ser muitos, mas tem que ser o suficiente para que o graph resultante não tenha, ou tenha
poucas, partes desconectadas.

O spectral clustering funciona pois as novas features, criadas por embedding, capturam
a estrutura, a forma, dos clusters.

O embedding realizado na PCA e no spectral clustering é um pouco diferente:

- No PCA o embedding que cria as novas features é uma combinação das features existentes,
assumindo uma relação linear entre elas;
- Nos graphs o embedding não é uma combinação de features (pois as features não existem),
é uma coisa mais "complicada" pois é um embedding não linear.

Em resumo: o spectral clustering use os eigenvectors da matriz Laplacian para
encontrar clusters que respeitam a estrutura e forma oculta nos dados.