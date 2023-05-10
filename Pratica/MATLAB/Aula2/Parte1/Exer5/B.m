%(b) Determine teoricamente se os acontecimentos A e B sao independentes.
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
pAB = 2 / 36;
pAPB = pA * pB;


% A e B são independentes se e so se p(AB) = P(A) * P(B)!
% Resposta: P(AB) = 0.05 E  P(A) * P(B) = 0.05, Logo são idependentes!