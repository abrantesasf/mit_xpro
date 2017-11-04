function freq = calculaFrequencia(pFragmento, pLetras)
% calculaFrequencia = função que retorna uma matriz com a quantidade de
% palavras com um número pLetras de letras, presente em um fragmento
% pFragmento de DNA.
% Observação: 1 <= pLetras <= 4

% Prepara tabela de palavras genéticas com pLetras:
alfabetoGenetico  = 'atcg';
palavras = [];
C = cell(pLetras, 1);
[C{:}] = ndgrid(alfabetoGenetico);
y = cellfun(@(alfabetoGenetico){alfabetoGenetico(:)}, C);
y = [y{:}];
palavras = y;

% Prepara matriz com contagem das palavras com pLetras:
freq = randi([1, 1018*4^pLetras], 1018, 4^pLetras) * 0;
for l = 1:size(pFragmento, 1)
    posicaoInicial = 1;
    posicaoFinal = pLetras;
    for c = 1:(size(pFragmento, 2)/pLetras)
        for p = 1:size(palavras)
            temp = pFragmento(l, posicaoInicial:posicaoFinal);
            if temp == palavras(p, 1:pLetras)
                freq(l, p) = freq(l, p) + 1;
            end
            p = p + 1;
        end
        posicaoInicial = posicaoInicial + pLetras;
        posicaoFinal = posicaoFinal + pLetras;
    end
    l = l + 1;
end

end