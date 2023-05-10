%%a probabilidade do acontecimento “ter pelo menos um 
%filho rapaz em famiılias com 2 filhos
N = 1e5;
filhos = rand(2,N) < 0.5;  %% 1 é a probabilidade de sair rapaz
resultados = sum(filhos) >= 1;
probabilidade = sum(resultados) / N

