# What is Clustering?

Já vimos que **Unsupervised Learning** serve para *descobrir padrões ocultos nos dados quando não temos nenhum label*.

Existem vários problemas que podemos resolver com Unsupervised Learning, mas o problema mais comum e popular para a
utilização de Unsupervised Learning é o **Clustering**.

## Clustering:

**Clustering** = *__agrupar__ os __dados__ de acordo com sua __similaridade__*, sendo que cada datapoint deve ser
alocado a um, e apenas um, grupo (cluster). Queremos identificar os grupos "latentes" ocultos nesse conjunto de dados.

Note que os conceitos-chave no clustering são:
* **Dados**:
  * Numéricos
  * Textuais
  * Genoma
  * Fotos
  * Áudios
  * Vídeos
  * etc.
* **Similaridade**:
  * Similares: quanto mais perto em distância estiverem
  * Dissimilares: quanto mais longe em distência estiverem
* **Agrupamento**:
  * Você aloca cada datapoint a um, e apenas um, grupo; pontos similares (próximos em distância) tendem
  a pertencer a um mesmo grupo, ou seja: estamos agrupando pontos similares baseados em sua distância
  * Esses grupos são chamados de *clusters*

Esses clusters devem ser significativos, devem ter um sentido e nos fornecer insights sobre o problema
em questão.

## Classification
Uma técnica de Supervised Learning que é um tanto parecida com o clustering é a **classification**. Aqui nós
temos os labels e podemos predizer o label para novos datapoints que aparecem.