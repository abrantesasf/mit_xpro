# Why and When to Use Clustering?

Algumas situações nas quais podemos usar clustering:

1. **Exploração dos dados**: as vezes temos uma coleção de dados mas não sabemos muito bem o que fazer com ela,
e podemos só querer explorar esses dados sem nenhum objetivo particular em mente. Ao realizar essa análise
exploratória de dados, podemos usar clustering para tentar obter algum insight.
2. **Classification-like, sem labels**: as vezes temos um problema que parece com classificação, mas não
temos os labels, ou pelo menos não temos os labels a priori. Por exemplo: identificar tópicos em uma coleção
de dados ou textos; nesse caso podemos usar clustering para separar os dados e acabar tendo um insight sobre
quais os labels poderiam ser criados.
3. **Labels são caros**: podem ser muitos labels ou muitos datapoints, e é demorado determinar qual o label
de cada datapoint. Por exemplo: criar labels para imagens e para os pixels dentro das imagens é difícil,
caro e demorado. Nesse caso podemos usar clustering!
4. **Labels mudam muito rapidamente**: quando os labels mudam muito rapidamente, é difícil manter os labels
atualizados.