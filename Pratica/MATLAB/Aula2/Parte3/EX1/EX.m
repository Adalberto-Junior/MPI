%Considere uma empresa fabricante de brinquedos que produz um determinado brinquedo. O brinquedo e´
%composto por dois componentes (1 e 2) que sao produzidos separadamente e posteriormente montados. No ˜
%final, os brinquedos sao embalados para comercializac¸ ˜ ao em caixas com ˜ n brinquedos cada.
%O processo de fabrico do Componente 1 produz p1 = 0, 2% de componentes com defeito. O processo de
%fabrico do Componente 2 produz p2 = 0, 5% de componentes com defeito. Um brinquedo esta com defeito ´
%se pelo menos um de seus componentes estiver com defeito. O processo de montagem produz pa = 1% de
%brinquedos com defeito (mesmo quando nenhum dos 2 componentes esta com defeito)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1. Considere o evento "A - uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito”.
N = 1e5;
n = 8;
p1 = 0.002;
p2 = 0.005;
pa = 0.01;
comp1 = rand(n,N) < p1;
comp2 = rand(n,N) < p2;
comp3 = rand(n,N) < pa;
pompFinal =  comp1 | comp2 | comp3;
%(a) Estime por simulac¸ao a probabilidade do evento A quando ˜ n = 8 brinquedos.
processo = sum(pompFinal) > 0;
prob = sum(processo) / N

%(b) Estime por simulac¸ao o n ˜ umero m ´ edio de brinquedos defeituosos apenas devido ao processo de ´
%montagem quando ocorre o evento A e n = 8 brinquedos.
px3 = sum(comp3)./N;
media = sum(sum(pompFinal.*px3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2. Considere o evento "B - uma caixa de brinquedos nao tem brinquedos com defeito”. 

%(a) Estime por simulac¸ao a probabilidade do evento B quando ˜ n = 8 brinquedos. 
zeroDefeito = sum(pompFinal) == 0;
prob_zero_defeito = sum(zeroDefeito) / N
%(b) Determine o valor teorico da probabilidade do evento B e compare-o com o valor estimado por ´
%simulac¸ao na quest ˜ ao 2(a). O que conclui?
p0Defeito_Teorico = 1 - prob
%R: São iguais;

%(c) Fac¸a as simulac¸oes necess ˜ arias para desenhar um gr ´ afico ´ plot da probabilidade do evento B em
%func¸ao da capacidade da caixa ˜ n. Considere todos os valores de n de 2 a 20. Descreva e justifique
%os resultados obtidos.
%%
%%pensando 
Nn = 2:2 : 20
plot(prob_zero_defeito,n)