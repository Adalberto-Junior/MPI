%%sabemos que um dos filhos e´
%rapaz. Qual a probabilidade do outro filho ser tambem rapaz? 
N = 1e5;
filhos = rand(2,N) < 0.5;  %% 1 é a probabilidade de sair rapaz
resultados = sum(filhos) >= 1;
probabilidadeA = sum(resultados) / N;
resultadosB = sum(filhos) == 2;
probabilidadeB = sum(resultadosB) / N;
probabilidade = sum(probabilidadeB)/ sum(probabilidadeA)

