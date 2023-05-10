%%
%3. Gere aleatoriamente uma matriz de transic¸ao de estados para uma cadeia de 20 estados (identificados de ˜
%1 a 20) recorrendo a func¸ ` ao do Matlab ˜ rand. Com base nessa matriz:

T = rand(20);
%%
%(a) Confirme que a matriz de transic¸ao de estados ˜ e estoc ´ astica. 
suma = sum(T);  %%duvida------->
newT = suma ./ T;
T_Normalizada = sum(newT)
% 0<= T >= 1; sim
%Acho que não:
%%
%(b) Qual a probabilidade de o sistema, comec¸ando no estado 1, estar no estado 20 apos 2 transic¸ ´ oes? E ˜
%apos 5? E ap ´ os 10? E ap ´ os 100? Apresente os resultados em percentagem e com 5 casas decimais. ´
%O que conclui?
p1to20_1 = T(20,1);
p1to20_2 = T(20,1)^2;
p1to20_5 = T(20,1)^5;
p1to20_10 = T(20,1)^10;
p1to20_100 = T(20,1)^100;
percentagem = 100;
fprintf("a probabilidade de o sistema, começando no estado 1, estar no estado 20 apos:\n")
fprintf("2 transições: %.5f \n",p1to20_2 * percentagem)
fprintf("5 transições: %.5f  \n",p1to20_5 * percentagem)
fprintf("10 transições: %.5f  \n",p1to20_10 * percentagem)
fprintf("100 transições: %.5f  \n",p1to20_100 * percentagem)
%p1to20_1000 = T(20,1)^1000
%R: Concluir que quantos mais trasições a probabilidade aproxima do zero e
% pode mesmo chegar a zero. 
