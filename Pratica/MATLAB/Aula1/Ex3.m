%Qual e a probabilidade de obter pelo menos 6 caras em 15 lanc¸amentos de uma moeda equilibrada? 
N = 1e5;  % numero de experiencia
p = 0.5; % probabilidade de cara;
k >= 6;   % numeros de caras;
n = 15;  % numero de lancamentos;
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N