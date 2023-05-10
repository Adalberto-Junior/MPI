%3. Considere as paginas web com as ligac¸ ´ oes apresentadas na figura:

H = [0  1/2  1/2  0  1/4  0
     1   0    0   0  1/4  0
     0   0    0   1  1/4  0
     0   0   1/2  0  1/4  1
     0   0    0   0   0   0
     0  1/2   0   0   0   0]
%(a) Usando a matriz da Google A, com β = 0.85, obtenha a estimativa do pagerank de cada pagina ´
%usando um metodo iterativo, repetindo o processo iterativo de c ´ alculo at ´ e que a diferenc¸a de page- ´
%rank entre duas iterac¸oes n ˜ ao exceda ˜ 0.01 em valor absoluto para todas as paginas. As colunas e ´
%linhas da matriz devem seguir a ordem alfabetica dos nomes das p ´ aginas. ´
%Quais as paginas com o menor e maior pagerank e qual o seu valor ?

beta = 0.85;
N = 6;
H2 = H;
H2(5,:) = 1/N
 H3 = beta * H2 + (1-beta) * ones(N)/N;
iterar = 0;

max_diferente = -1; % pelo menos uma vez no while
pa = ones(6,1)/N; % panterior

while max_diferente < 0.01
    fprintf("Iteração: %d\n", iterar);
    p = H3 * pa;


    diferentes = abs(p - pa);
    max_diferente = max(diferentes);

    iterar= iterar+1;
    pa = p;
    %disp(max_diferente)
end
disp(p)
 fprintf("A pagina com maior pageRank é d.br com : %f\n", p(4));
 fprintf("A pagina com menor pageRank é f.nl com : %f\n", p(6));

 %(b) Confirme os valores de pagerank obtidos usando um processo nao iterativo.

 %Duvida
