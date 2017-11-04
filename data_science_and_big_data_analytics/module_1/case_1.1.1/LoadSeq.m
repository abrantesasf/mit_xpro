function str = LoadSeq(fafile)
% LoadSeq lê um arquivo de seqüência genética no formato Fasta.
% Chamada da função: LoadSeq(path/to/fasta-file)
% Retorno: string de letras com a seqüência genética

  % Variáveis:
  fid = fopen(fafile);
  i = 1;
  str = '';

  % Mensagem:
  disp('Reading fasta-file...');
  
  % Loop:
  while 1
      if round(i/200) == i/200
          disp(strcat(int2str(i),' lines'));
      end
      
      tline = fgetl(fid);
      if ~ischar(tline)
          break;
      end
    
      if(size(tline)~=0)
          if(strcmp(tline(1),'>') == 0)
              str = strcat(str,tline);
          end
      end
      
      i=i+1;
      
  end
  
  nn = size(str);
  n = nn(2);
  disp(strcat('Length of the string: ',int2str(n)));
end