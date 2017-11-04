%% PCA e K-Means para decifrar o genoma
% Abrantes Araújo Silva Filho (abrantesasf@gmail.com)
%
% Este é um
% estudo de caso reproduzindo a análise de *Alexander N. Gorban* e *Andrei
% Y. Zinovyev*, publicada no livro _*Principal Manifolds for Data
% Visualization and Dimension Reduction (Lecture Notes in Computational
% Science and Engineering)*_. O capítulo original pode ser baixado
% na íntegra no site do autor (<http://www.ihes.fr/~zinovyev/>) e o livro
% pode ser
% <https://www.amazon.com.br/gp/product/3540737499/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=3540737499&linkCode=as2&tag=abrantesasf01-20&linkId=5334538bfcf0a64c5db86324d8cd1829
% adquirido na Amazon>.
%
% Atenção: como eu apenas reproduzi a análise original dos autores citados,
% como forma de estudo da aplicação de PCA e K-Means no MATLAB, nenhum
% conteúdo aqui é de minha autoria, EXCETO algumas funções para o MATLAB
% (as funções originais fornecidas pelos autores, no livro publicado em
% 2007, não funcionaram no MATLAB R2017a, que é a versão que eu utilizo;
% assim, tive que reescrever totalmente algumas funções para reproduzir a
% análise na minha versão do MATLAB... e essas novas funções são de
% minha autoria). Eu indiquei no texto quais foram as funções que eu
% preparei e quais são as funções originais dos autores.

%% O problema a ser resolvido
% Quando alguma notícia surge dizendo que o genoma, por exemplo, de uma
% bactéria foi decifrado, geralmente a notícia quer dizer apenas que esse
% genoma foi lido e transcrito como uma grande seqüência de 4 letras: A, C,
% G e T. Por exemplo:
% 
% [...]cgtggtcaatgatgcctagggcgcacgtatgcctagctagtttccagactcagtgcgttaactagctaa[...]
% 
% Essa seqüencia de letras é só o primeiro passo para decifrar o genoma.
% Mais importante do que a seqüência de letras é tentar descrobrir _*a
% mensagem codificada nessa seqüência de letras*_, a mensagem genética que nos faz
% ser o que somos. E essa mensagem é formada por uma seqüência dessas
% letras, de comprimento variável, chamada de *_gene_*. Por exemplo, na
% seqüência abaixo, podemos ver 2 genes (em negrito-itálico vermelho):
%
% <html>
% [...]cgtggtca<b><i><font color="red">atgatgcctag</font></i></b>ggcgcacgt<b><i><font color="red">atgcctagctagtttccagactcagtgcgttaa</font></i></b>ctagctaa[...]
% </html>
%
% Dada essa estrutura, alfabeto de 4 letras formando os genes, algumas perguntam
% precisam de respostas:
%
% # Todas as letras fazem parte de algum gene? Ou seja, toda a seqüência de
% letras sempre formará um ou mais genes? Ou existem seqüências de letras que não
% formam genes?
% # Dentro de um gene, as letras por si mesmas são responsáveis pela
% informação genética ou é algum tipo de agrupamento das letras (uma "palavra") que contém a informação genética? Por
% exemplo: a informação genética é contida a cada palavra com duas, três,
% quatro, cinco ou mais letras?
% # Se dentro de um gene a informação genética é dada, por exemplo, por grupos de
% 4 letras ("palavras" de 4 letras), algumas dessas letras podem ser
% sobrepostas à outras palavras? Por exemplo: as letras CASAPO podem formar
% 2 palavras de 4 letras, CASA e SAPO. Essa sobreposição das letras SA
% existe nos genes?
% 
% Décadas de pesquisas genéticas já forneceram respostas para essas
% perguntas:
%
% # Existem letras que realmente não formam genes, elas parecem estar ali
% para preencher o espaço "vazio"
% # A informação genética é contida a cada grupo de 3 letras, chamado de
% códon
% # Não existe sobreposição das letras, ou seja, as letras que formam um
% códon não são utilizadas para formar outro códon. Por exemplo, as letras
% SALUA não formam 2 palavras de 3 letras (SAL e LUA), pois haveria
% sobreposição da letra L. Os códons não são sobrepostos.
%
% Assim, já sabemos que nossa informação genética está codificada em genes,
% que são seqüências específicas das letras A, C, G e T, e que dentro
% desses genes, a informação genética está contida em códons, agrupamentos
% de 3 letras, sem sobreposição. Uma outra observação: os genes em
% organismos simples, como uma bactéria, tendem a ser seqüências
% ininterruptas mas, em organismos superiores, como o homem, os genes pode
% ser "quebrados", sem formar uma seqüência ininterrupta (um mesmo gene
% pode ser dividido em dois ou mais pedaços separados no DNA).
%
% Neste estudo de caso estamos interessados em usar PCA e K-Means para duas
% coisas:
%
% * Usaremos a PCA para "descobrir" que a informação genética está contida em grupos de 3
% letras (os códons), e não em grupos de 1, 2, 4 ou mais letras; e
% * Usaremos o K-Means para encontrar a localização dos genes na seqüência
% de letras do DNA.
%
% Utilizaremos um fragmento do DNA da bactéria _Caulobacter crescentus_, na
% qual o tamanho médio dos genes é de aproximadamente 1000 letras.

%% Ambiente da análise
% A análise foi realizada utilizando-se o MATLAB R2017a, em um notebook
% Linux (Fedora 26), 64 bits, com 6 GB RAM. A análise foi realizada em um
% script, em MATLAB Markup, para reprodutibilidade.

% Informações sobre o Linux:
!uname -a

%%

% Informações sobre o MATLAB:
ver

%% Leitura da seqüência do DNA da _Caulobacter crescentus_
% Um fragmento do DNA da bactéria está em um arquivo no formato _Fasta_, com
% a extensão _.fa_, e precisa ser lido para alguma estrutura do MATLAB.
% Os autores originais forneceram a função LoadSeq para isso:

% Lê o aquivo para o objeto vetor DNA:
dna = LoadSeq('ccrescentus.fa');

%%
% Estrutura do vetor dna
whos dna

% Podemos ver que o objeto dna é um vetor de linha do tipo caracteres, e tem 305.400 letras (A, C,
% G e T).

%%
% Vamos ver as 100 primeiras letras:
dna(1:100)

%%
% Agora vamos comprovar que esse vetor de letras não tem nenhum espaço ' ':
contains(dna, ' ')

%% Criação dos datapoints
% Note que até o momento a única coisa que temos é o objeto vetor, com a
% seqüência de 305.400 letras, sem nenhum epaço entre essas letras. Não
% temos nenhuma separação de "palavras" aqui, só uma grande seqüência de
% letras.
%
% Essa seqüência de letras não serve como datapoint para nossas análises,
% precisamos criar tais datapoints. Faremos isso com o seguinte
% procedimento:
%
% # Quebraremos a seqüência de letras em pedaços de 300 letras: segundo os
% autores, como o tamanho médio do gene de uma bactéria é de 1000 letras,
% pedaços com 300 letras são suficientes para detectar os genes nessa
% escala;
% # Calcularemos a quantidade de palavras (agrupamentos de letras) dentro
% de cada pedaço de 300 letras, contando quantas palavras com 1, 2, 3 e 4
% letras (não sobrepostas) existem em cada pedaço.
%
% Dessa maneira teremos 4 matrizes diferentes:
% * Matriz 1: 1018 linhas e 4 colunas (para a quantidade de palavras de 1
% letra: a, t, c e g)
% * Matriz 2: 1018 linhas e 16 colunas (para a quantidade de palavras com 2
% letras: aa, at, ac, ...)
% Matriz 3: 1018 linhas e 64 colunas (para a quantidade de palavras com 3
% letras: aaa, aat, ata, ...)
% Matriz 4: 1018 linhas e 256 colunas (para a quantidade de palavras com 4
% letras: aaaa, aaat, aatt, atat, ...)
%
% Nossos datapoints serão a contagem das palavras de 1, 2, 3 ou 4 letras,
% em cada um dos 1018 fragmentos com 300 letras de DNA.

% A primeira coisa que temos que fazer então é dividir nossa seqüência de
% DNA com 305.400 letras, em 1018 fragmentos com 300 letras. Para isso
% vamos usar a função preparaFramentos.m que eu escrevi:

fragmentos = preparaFragmentos(dna, 300);

%%

% Agora vamos calcular a freqüencia das palvras com 1, 2, 3 ou 4 letras, em
% cada fragmento de DNA com 300 letras, utilizando a função
% calculaFrequencia.m que eu escrevi:
xx1 = calculaFrequencia(fragmentos, 1);
xx2 = calculaFrequencia(fragmentos, 2);
xx3 = calculaFrequencia(fragmentos, 3);
xx4 = calculaFrequencia(fragmentos, 4);

%% Visuzliando quantas letras foram uma palavra genética (códon)
% Agora que temos 4 matrizes com as contagens das palavras genéticas com 1,
% 2, 3 e 4 letras, a tarefa é tentar descobrir se a informação genética
% está armazenada em palavras com 1, 2, 3 ou 4 letras.
%
% Poderíamos tentar
% plotar gráficos para descobrir mas com 4 a 256 variáveis, não é possível
% um gráfico com tantas dimensões. A solução é usar Principal Componente
% Analysis (PCA) e plotar gráficos com apenas os 2 componentes principais,
% permitindo assim uma fácil visualização. Os autores originais forneceram
% a função PCAFreq.m, que faz a PCA e já plota o gráfico:
%
% Gráfico para palavras genéticas com 1 letra:
PCAFreq(xx1);
%%
% Gráfico para palavras genéticas com 2 letras:
PCAFreq(xx2);
%%
% Gráfico para palavras genéticas com 3 letras:
PCAFreq(xx3);
%%
% Gráfico para palavras genéticas com 4 letras:
PCAFreq(xx4);
%%
% Como ficou evidente pelos 4 gráficos acima, a informação genética está
% codificada em *palavras com 3 letras*, os códons, pois foi o único
% gráfico que apresentou uma estrutura claramente visível, com 7
% agrupamentos claramente visíveis: 6 agrupamentos ao redor de 1
% agrupamento central.
%
% Os gráficos para palavras com 1, 2 ou 4 letras não apresentaram nenhuma
% estrutura aparente, indicando que a informação genética realmente está
% codificada em palavras com 3 letras.
%
% O motivo do gráfico mostrar 7 agrupamentos distintos é explicado em
% detalhes pelos autores e é relacionado ao modo arbitrário que usamos para
% dividir a seqüencia de DNA em fragmentos para análise. Para maiores
% informações, veja a publicação original.
%
%% Realizando clusterização com K-Means para visualizar os agrupamentos
% Já temos uma boa idéia com o PCA que a informação genética em um gene
% está codificada em palavras com 3 letras. Vamos agora utilizar uma
% técnica de unsupervised learning, o clustering, utilizando o K-Means,
% para visualizarmos os clusters de códons.
%
% Os autores forneceram a função ClustFreq.m que faz o K-Means e mostra
% graficamente o resultado:
fragn = ClustFreq(xx3, 7);
%%
% Podemos ver claramente os 6 clusters de informações genéticas formando
% uma espécie de cículo, e 1 cluster central (que contém informações
% não-genéticas).
%
% Como um último exercício os autores forneceram a função GenBrowser.m que
% pega o resultado da clusterização e aplica essa clusterização às letras
% do fragmento de DNA, colorindo esse DNA de acordo com os clusters. Isso
% resulta em uma espécie de "navegador" genético primitivo, que mostra os
% clusters coloridos na seqüência de letras:
GenBrowser(dna, 300, fragn, 13000);
%% Acesso ao dataset e códigos:
% O dataset de DNA da bactéria e as funções para MATLAB (tanto as
% fornecidas pelos autores originais, quanto as que eu preparei), estão
% disponíveis em meu repositório GitHub em:
% 