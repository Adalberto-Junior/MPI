%Considere a variavel aleat ´ oria ´ X correspondente a face que fica para cima no lanc¸amento de 1 dado. `
%Usando os valores teoricos: ´
%(a) produza um grafico, em Matlab, que represente a func¸ ´ ao massa de probabilidade ˜
%1 de X;

%Sx = [1 2 3 4 5 6]  % 1:6
Sx = 1:6
prob = ones(size(Sx))/6;  %cfav / cposs
stem(Sx, prob)
xlim([0 7]) %para dar limites do eixo x da função 

axis ([0 7 -0.01 0.2])
title('fmp de X')
xlabel('x_i'), ylabel('p(x_i)')
