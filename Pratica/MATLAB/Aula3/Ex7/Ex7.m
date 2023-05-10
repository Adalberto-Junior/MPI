%7. Considere o conjunto de paginas Web e respetivas hyperligac¸ ´ oes entre si dado pelo diagrama seguinte: 


%(a) Usando a matriz H das hyperligac¸oes, obtenha a estimativa do pagerank de cada p ˜ agina ao fim de ´
%10 iterac¸oes. Relembre que deve considerar (i) a mesma probabilidade de transic¸ ˜ ao de cada p ˜ agina ´
%para todas as paginas seguintes poss ´ ´ıveis e (ii) a probabilidade da pagina inicial deve ser igual para ´
%todas as paginas. Qual/quais a(s) p ´ agina(s) com maior pagerank e qual o seu valor?
%Criar matriz só com zeros e uns;
%saidas = sum(H);
%MH = H ./ saidas

H = [0  0  0  0  1/3  0
     1  0  0  0  1/3  0
     0 1/2 0  1   0   0
     0  0  1  0   0   0
     0 1/2 0  0   0   0
     0  0  0  0  1/3  0];
N = 6;
pr = ones(6,1)/N;
n = 10;
%keepPageRank = zeros(n:1);
for i = 1 : n

    pr = H * pr;
    %keepPageRank(i) = pr;
end
pr
fprintf("A pagina com  maior pagerank é o C com valor de %.4f\n",pr(3));

%%
%(b) Identifique a ”spider trap”e o ”dead-end”contidos neste conjunto de paginas. 
%R: Os sprider Trap: B,C e D; 
%R: Os dead-end: F;
%%
%(c) Altere a matriz H para resolver apenas o problema do ”dead-end”e recalcule o pagerank de cada
%pagina novamente em 10 iterac¸ ´ oes.
H2 = H
H2( :,6) = 1/N

%H = [0  0  0  0  1/3  1/N
 %    1  0  0  0  1/3  1/N
  %   0 1/2 0  1   0   1/N
  %   0  0  1  0   0   1/N
  %   0 1/2 0  0   0   1/N
  %   0  0  0  0  1/3  1/N];
  pr = ones(6,1)/N;
  for i = 1 : n

    pr = H2 * pr;
    %keepPageRank(i) = pr;
  end
    disp(pr)

  %%
  %(d) Resolva agora ambos os problemas e recalcule o pagerank de cada pagina novamente em 10 ´
%iterações (assuma ˜ β = 0, 8).
    beta = 0.8;
    H3 = beta * H2 + (1-beta) * ones(N)/N;
    pr = ones(6,1)/N;
    for i = 1 : n

    pr = H3 * pr;
    end
    disp(pr)
%%

%(e) Calcule agora o pagerank de cada pagina considerando um n ´ umero m ´ ´ınimo de iterac¸oes que garanta ˜
%que nenhum valor muda mais do que 10−4
%em 2 iterac¸oes consecutivas. Quantos iterac¸ ˜ oes s ˜ ao˜
%necessarias? Compare os valores de pagerank obtidos com os da alínea anterior. O que conclui?


iterar = 0;

max_diferente = 1; % pelo menos uma vez no while
pa = ones(6,1)/N; % panterior

while max_diferente > 1e-5
    fprintf("Iteração: %d\n", iterar);
    p = H3 * pa;


    diferentes = abs(p - pa);
    max_diferente = max(diferentes);

    iterar= iterar+1;
    pa = p;
end