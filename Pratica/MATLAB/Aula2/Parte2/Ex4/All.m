%Sabendo que um processo de fabrico produz 30% de peças defeituosas e considerando a variável aleatória
%X, representativa do numero de peças defeituosas numa amostra de 5 peças tomadas aleatoriamente, ´
%obtenha:

%Dados:
    N = 1e5; % número de esperiencias
    p = 0.3; % probabilidade de sair uma peça defeituosa;
    n = 5;   % números da peças;
    X = 0:5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) Por simulação:
    fabrico = rand(n,N) < p;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %i. estimativa para a função massa de probabilidade de  X;
     PX = zeros(1,n+1);
     for i = 0:n
            sucessos = sum(fabrico) == i;
            PX(i+1) = sum(sucessos)/N;
     end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ii. o grafico representativo da função distribuição acumulada de probabilidades de  X;
    fx = cumsum(PX);
    stairs(X,fx)
    title('fmp de X')
    xlabel('x_i'), ylabel('f(x_i)')

%iii. estimativa para probabilidade de, no maxímo, 2 das pec¸as de uma amostra serem defeituosas.
    PMax2 = PX(1) + PX(2) + PX(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Print():
    fprintf('Função massa de probabilidade:\n');
    fprintf('PX(0) = %4.4f\n',PX(1));
    fprintf('PX(1) = %4.4f\n',PX(2));
    fprintf('PX(2) = %4.4f\n',PX(3));
    fprintf('PX(3) = %4.4f\n',PX(4));
    fprintf('PX(4) = %4.4f\n',PX(5));
    fprintf('PX(5) = %4.4f\n',PX(6));

    fprintf('probabilidade de no maximo 2 das peças serem defeituosas:\n');
    fprintf('PMax2 = %4.4f\n',PMax2);