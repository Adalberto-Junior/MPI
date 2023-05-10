%%e uma fam´ılia com 5 filhos. Sabendo que pelo menos um dos filhos e rapaz, obtenha por ´
%simulac¸ao uma estimativa para a probabilidade de um dos outros (e apenas um) ser tamb ˜ em rapaz.
%A = "Ser apenas dois rapaz"
%B = "Pelo menos 1 rapaz"
N = 1e5;
p = 0.5;
n = 5;
k = 2;
filhos = rand(5,N) < p;  %% 1 é a probabilidade de sair rapaz
CFB = sum(filhos) >=1;
pB = sum(CFB)/N
pA = nchoosek(n,k)*p^k*(1-p)^(n-k)
pBA = pB * pA
pBCA = pBA / pB


