%%PROBABILIDADE INVERSO:
%%Sabendo que o primeiro filho de uma fam´ılia com 2 filhos e rapaz, determine por simulac¸ ´ ao a ˜
%probabilidade do segundo filho ser rapaz.
N = 1e5;
filhos = rand(2,N) < 0.5;  %% 1 é a probabilidade de sair rapaz
CFb = sum(filhos(1,:) == 1);
CFab = sum(sum(filhos) == 2);
probabilidade = CFab/CFb
