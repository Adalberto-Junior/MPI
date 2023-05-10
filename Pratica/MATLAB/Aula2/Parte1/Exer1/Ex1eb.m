%%e uma fam´ılia com 5 filhos. Sabendo que pelo menos um dos filhos e rapaz, obtenha por ´
%simulac¸ao uma estimativa para a probabilidade de um dos outros (e apenas um) ser tamb ˜ em rapaz.
%A = "Ser apenas dois rapaz"
%B = "Pelo menos 1 rapaz"
N = 1e5;
p = 0.5;
n = 5;
k = 2;
filhos = rand(5,N) < p;  %% 1 é a probabilidade de sair rapaz
%%CFB = sum(filhos) >=1;
%pB = sum(CFB)/N;
%pA = sum(filhos) == 2;
%CFA = sum(filhos) == 2;
%%pA = sum(CFA)/N;
%pBA = pA & pB
%pBCA = pBA / pB
n_filhosM = sum(filhos); %pelo menos um ser rapaz
B = n_filhosM >= 1;
A = n_filhosM == 2;
AB = A & B;
prob = sum(AB)/sum(B)

