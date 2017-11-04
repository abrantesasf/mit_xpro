function frags = preparaFragmentos(seqDNA, pTamanho)
% preparaFragmentos: função que pega uma seqüência de letras de DNA, seqDNA, e
% corta essa seqüência em fragmentos com tamanho "pTamanho"
pos = 1;
frags = [];
for i = 1 : size(seqDNA, 2)/pTamanho
    frags = [frags; seqDNA(pos:i*pTamanho)];
    i = i + 1;
    pos = pos + pTamanho;
end