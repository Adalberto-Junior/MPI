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
%H2(5,:) = 1/N
 H3 = beta * H2 + (1-beta) * ones(N)/N;
iterar = 0;
paginas = ["a.pt ";"b.es ";"c.fr ";"d.br ";"e.com";"f.fl "]

max_diferente = 1; % pelo menos uma vez no while
pa = ones(6,1)/N; % panterior

while max_diferente > 0.01
    fprintf("Iteração: %d\n", iterar);
    p = H3 * pa;
    diferentes = abs(p - pa);
    max_diferente = max(diferentes);

    iterar= iterar+1;
    pa = p;
    %disp(max_diferente)
end
disp(p)
[M I] = max(p);
[m i] = min(p);
 fprintf("Iterativo:\n")
 fprintf("A pagina com maior pageRank é %s com : %f\n",paginas(I),M);
 fprintf("A pagina com menor pageRank é %s com : %f\n",paginas(i), m);

 %(b) Confirme os valores de pagerank obtidos usando um processo nao iterativo.
    M = [H3 - eye(length(H3)); ones(1,length(H3))]; % Hu = u <-> (H - I)u = 0
    %como este sisytema de equação é indeterminado temos de substituir as
    %segunda linha por u1+u2 = 1;
    x = [zeros(length(H3),1); 1];
    u = M \ x;

    [Ma In] = max(u);
    [mi in] = min(u);
 fprintf("\n");
 fprintf("NÃO Iterativo:\n")
 fprintf("A pagina com maior pageRank é %s com : %f\n",paginas(In),Ma);
 fprintf("A pagina com menor pageRank é %s com : %f\n",paginas(in), mi);
 %Duvida
