%“A – a soma dos dois valores e igual a 9”,
% “B – o segundo valor ´ e par”,
% “C – pelo menos um dos valores ´e igual a 5” 
% e “D – nenhum dos valores ´ e igual a 1”.

N = 1e5;

lancamento = randi(6,2,N);
soma = sum(lancamento);
%P(A):
Acomparar = soma == 9;
pA = sum(Acomparar)/N
%P(B):
segLinha = lancamento(2,:);
result = rem(segLinha,2) == 0;
pB = sum(result) / N
%Probabilidade c: pelo menos um ser 5:
C = sum(lancamento(1,:) == 5 | lancamento(2,:) == 5);
probC = sum(C) / N
%%Probabilidade D: pelo menos um ser 5:
D = sum(lancamento(1,:) ~= 1 & lancamento(2, :) ~= 1);
probD = sum(D) / N





