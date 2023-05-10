%%
%4.2
%1. Com as func¸oes que desenvolveu, crie um ˜ Bloom Filter para guardar um conjunto, U1, de 10 palavras
%diferentes5 . Use um Bloom Filter de tamanho n = 100 e k = otimo func¸oes de dispers ˜ ao. 
%Parametros de entrada:
n = 100;
m = 10;
k = uint8((n * 0.693)/m);  %K otimo
key = 25;

%inicializar o filtro:
B = init_bloom(n,k);
max(B)
sum(B)
%gerar word/chaves:
N = 1e5;
imin = 6;
imax = 20;
symb = ['a':'z' 'A':'Z'];
word = genarate(m, imin,imax,symb);

%inserir elemento no filtro:
F = add(B,'Banana',k);
F = add(F,'Aveiro',k);
F = add(F,'Averia',k);
stem(F)
%max(C)
%verificar se é membero:
r = ismember(F,'Banana',k)
r = ismember(F,'Adalberto',k)