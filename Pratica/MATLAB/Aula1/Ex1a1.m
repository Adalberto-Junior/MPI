%%
N = 1e5; %numero de esperiencia
p = 0.5; %probabilidade de cara
k = 2;   %numero de caras
n = 3;  %numero de lançamento
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
aux = sum(sucessos);
probSimulacao = aux / N