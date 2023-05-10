%Considere a variavel aleat ´ oria ´ X correspondente a face que fica para cima no lanc¸amento de 1 dado. `
%Usando os valores teoricos: ´
%(a) produza um grafico, em Matlab, que represente a func¸ ´ ao massa de probabilidade ˜
%1 de X;

%Sx = [1 2 3 4 5 6]  % 1:6
Sx = 1:6
px = ones(size(Sx))/6;  %cfav / cposs
figure(1)
subplot(1,2,1)
stem(Sx, px)
xlim([0 7])
grid on

%(b) num segundo grafico da mesma figura, desenhe o gr ´ afico da func¸ ´ ao de distribuic¸ ˜ ao acumulada (use ˜
%a func¸ao˜ stairs do Matlab).

fx = cumsum(px);
subplot(1,2,2)
stairs([0 Sx 7 ], [ 0 fx 1])
xlim([0 7])
ylim([0 1.1])
grid on 

axis ([0 7 -0.01 0.2])
title('fmp de X')
xlabel('x_i'), ylabel('p(x_i)')
