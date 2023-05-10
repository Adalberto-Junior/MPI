%6. Considere a cadeia de Markov com o diagrama de transic¸ao de estados seguinte: ˜
%----

%(a) Defina em Matlab a matriz de transic¸ao de estados ˜ T, com Tij sendo a probabilidade de ir do estado
%j para o estado i num unico passo.:

T = [0.8  0  0.3 0 0
     0.2 0.6 0.2 0 0
      0  0.1 0.4 0 0
      0  0.3  0  1 0
      0   0  0.1 0 1];
%%
%(b) Fac¸a um grafico com a probabilidade de, comec¸ando no estado 1, estar no estado 2 ao fim de ´ n
%passos, com n a variar de 1 ate 100. Justifique o que observa.
n = 100;
keepP1_2 = zeros(1,n);
%keepP1_2(1,1) = T(2,1);
for i = 1:n
    temp = T^i;
    keepP1_2(i) = temp(2,1);
end

plot(keepP1_2,1:n);

%%
%(c) Fac¸a um grafico com a probabilidade de, comec¸ando no estado 1, estar no estado 3 ao fim de ´ n
%passos. Na mesma figura, fac¸a um segundo grafico com a probabilidade de, comec¸ando no estado ´
%1, estar no estado 5 ao fim de n passos. Em ambos os casos, considere n a variar de 1 ate 100. ´
%Justifique o que observa.

n = 100;
%v=[1 0 0 0 0]
keepP1_3 = zeros(1,n);
keepP1_5 = zeros(1,n);
%keepP1_2(1,1) = T(2,1);
for i = 1:n
    temp = T^i;
    temp2 = T^i;
    keepP1_3(i) = temp(4,1);
    keepP1_5(i) = temp2(5,1);
end
figure(2)
subplot(1,2,1)
plot(keepP1_3,1:n);
%figure(3)
subplot(1,2,2)
plot(keepP1_5,1:n);

%%
%(d) Determine a matriz Q
linhaT = 1:3;
colunaT = 1:3;
Q = T(linhaT,colunaT)

%%
%(e) Determine a matriz fundamental F = (I -Q)^(-1).
I = eye(size(Q));
F = inv(I - Q)
%fprintf(" F);
%%
%(f) Qual a media (valor esperado) do número de passos até a absorção começando no estado 1? E 
%começando no estado 2? E se começando no estado 4?
mAb = sum(F);
mAb1 = mAb(1);
mAb2 = mAb(2);
mAb4 = mAb(3);
fprintf("Media do números de Passos até a absorção começando no:\n");
fprintf("Estado 1 = %f\n",mAb1);
fprintf("Estado 2 = %f\n",mAb2);
fprintf("Estado 4 = %f\n",mAb4);

%%
%(g) Comec¸ando no estado 1, qual e a probabilidade de absorc¸ ´ ao do estado 3? E do estado 5? Verifique ˜
%a coerencia destes valores com o que observou na al ˆ ´ınea 6c).
numEstadoNaoAbsorventes = 3;
R=T(numEstadoNaoAbsorventes + 1:end, 1:numEstadoNaoAbsorventes);

B = R * F;
fprintf("Começando em 1, a probabiblidade de absorção ao estado 3 é = %f\n",B(1,1));
fprintf("Começando em 1, a probabiblidade de absorção ao estado 5 é = %f\n",B(2,1));





