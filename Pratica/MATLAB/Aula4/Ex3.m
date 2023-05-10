%1. Com as func¸oes que desenvolveu, crie um ˜ Bloom Filter para guardar um conjunto, U1, de 1000 palavras
%diferentes5. Use um Bloom Filter de tamanho n = 8000 e k = 3 func¸oes de dispers ˜ ao.

n = 8000;
m = 1000;
k = 3;
%inicializar o filtro:
B = init_bloom(n,k);
%gerar word/chaves:
N = 1e5;
imin = 6;
imax = 20;
symb = ['a':'z' 'A':'Z'];
word = genarate(m, imin,imax,symb);

%inserir elemento no filtro:
for i = 1:m
    F = add(B,word{i},k);
    B = F;
end
%max(F)
%stem(F)
%verificar se é membero:
falsosNegativo = zeros(1,m);
for i = 1:m
    falsosNegativo(i) = ismember(F,word{i},k);
end
faNeg = sum(falsosNegativo == 0);
if faNeg == 0
    fprintf("Nenhum falsos negativos encontrados!\n");
else
    fprintf("Foram encontrados %d falsos negativos!\n",faNeg);
end

%gerar Novas word/chaves:
symb1 = ['a':'z' '1':'9'];
newm = 10000;
word1 = genarate(newm, imin,imax,symb1);

falsosPositivos = zeros(1,newm);
for i = 1:newm
    falsosPositivos(i) = ismember(F,word1{i},k);
end
fapos = sum(falsosPositivos == 1);
if fapos == 0
    fprintf("Nenhum falsos positivos encontrados!\n");
else
    fprintf("Foram encontrados %d falsos positivos!\n",fapos);
     fprintf("A percentagem de falsos positivos é %.2f%%\n",fapos/100);

end

%Calculos de Estimativas de falsos positivos:
pfp = (1 - exp(1)^-k*newm/n)^k;
fprintf("A probabilidade estimada de falsos positivos seguindo os calculos de TP é de %.2f\n",pfp);
fprintf("Segundo a estimativa é muito provavel que hava falsos positivos na condição escolhida\n");

%
k1 =  4:10;
%inicializar o filtro:
Blom1 = init_bloom(n,k);
Blom2 = init_bloom(n,k);
Blom3 = init_bloom(n,k);
Blom4 = init_bloom(n,k);
Blom5 = init_bloom(n,k);
Blom6 = init_bloom(n,k);
Blom7 = init_bloom(n,k);
%inserir elemento no filtro:
for i = 1:m
    A1 = add(Blom1,word{i},k1(1));
    A2= add(Blom2,word{i},k1(2));
    A3 = add(Blom3,word{i},k1(3));
    A4 = add(Blom4,word{i},k1(4));
    A5 = add(Blom5,word{i},k1(5));
    A6 = add(Blom6,word{i},k1(6));
    A7 = add(Blom7,word{i},k1(7));
    Blom1 = A1;
    Blom2 = A2;
    Blom3 = A3;
    Blom4 = A4;
    Blom5 = A5;
    Blom6 = A6;
    Blom7 = A7;
end
%Pertença e falsos positivos:
%%
falsosPositivos1 = zeros(1,newm);
falsosPositivos2 = zeros(1,newm);
falsosPositivos3 = zeros(1,newm);
falsosPositivos4 = zeros(1,newm);
falsosPositivos5 = zeros(1,newm);
falsosPositivos6 = zeros(1,newm);
falsosPositivos7 = zeros(1,newm);

for i = 1:newm
    falsosPositivos1(i) = ismember(A1,word1{i},k1(1));
    falsosPositivos2(i) = ismember(A2,word1{i},k1(2));
    falsosPositivos3(i) = ismember(A3,word1{i},k1(3));
    falsosPositivos4(i) = ismember(A4,word1{i},k1(4));
    falsosPositivos5(i) = ismember(A5,word1{i},k1(5));
    falsosPositivos6(i) = ismember(A6,word1{i},k1(6));
    falsosPositivos7(i) = ismember(A7,word1{i},k1(7));
end
falPos_em_fun_K = zeros(1,length(k1)+1);
falPos_em_fun_K(1) = sum(falsosPositivos==1);
falPos_em_fun_K(2) = sum(falsosPositivos1==1);
falPos_em_fun_K(3) = sum(falsosPositivos2==1);
falPos_em_fun_K(4) = sum(falsosPositivos3==1);
falPos_em_fun_K(5) = sum(falsosPositivos4==1);
falPos_em_fun_K(6) = sum(falsosPositivos5==1);
falPos_em_fun_K(7) = sum(falsosPositivos6==1);
falPos_em_fun_K(8) = sum(falsosPositivos7==1);
K2 = 3:10;
plot(K2,falPos_em_fun_K);
grid("on")

[mim, Index] = min(falPos_em_fun_K);
%if Index == 1
 %   fprintf("O K otimo segundo os testes feitos e o grafico é k = %d porque este tem o menor falsos positivos; %d\n",k ,mim);
%else
    fprintf("O K otimo segundo os testes feitos e o grafico é k = %d porque este tem o menor falsos positivos; %d\n",K2(Index), mim);
%end




%r = ismember(F,word{1},k)
%r = ismember(F,'Adalberto',k)
