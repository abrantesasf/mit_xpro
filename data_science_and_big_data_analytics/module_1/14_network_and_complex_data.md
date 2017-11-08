# Networks and Complex Data

Uma outra limitação da clusterização e do K-Means, é que K-Means assume que nossos datapoints são
compostos por um *_feature vector_*. Por exemplo, para clusterizar e-mails em grupos de spam ou ham,
nosso feature vector é um vetor que contém a freqüência de ocorrência de várias palavras em cada
e-mail (cada entrada nesse vetor corresponde a uma palavra, e o número correspondente a essa
palavra mostra o quão freqüente ela é nesse datapoint - que é o próprio e-mail). Nessa situação
é possível usar K-Means.

Mas em outras situações o feature vector não está presente ou está presente de forma muito precária
ou em excesso. Por exemplo:

- Os feature vectors podem conter muito ruído ou informação inútil
  - Uma imagem como datapoint pode conter milhares de pixels "inúteis", como o background,
  que são constantes ou variam aleatoriamente (nesse caso específico, a informação importante
  é como a imagem se desvia de modo significativo de alguma "imagem média", por exemplo: variações
  no cabelo, óculos, barba, etc.).
- Os datapoints podem não conter nenhum feature vector
  - Laços de amizade em redes sociais não contém nenhum feature vector aparente, mas temos
  uma informação de quem fala e se relaciona com quem. Isso nos dá um gráfico de edges e nodes,
  sendo que grupos de amigos terão mais edges entre eles.
- Os feature vectors podem ser enormes, com milhares de entradas
  - Uma pessoa é o datapoint e as features são as variações no genoma
  - Uma imagem é um datapoint, e as features são as centenas de milhares de pixels da imagem

Os exemplos acima mostram situações onde K-Means não se aplica diretamente, e teremos que
criar novas features que sejam capazes de revelar a estrutura oculta nos dados. Cada datapoint
deverá ser representado por essas novas features, que são construídas levando-se em conta todo
o dataset.