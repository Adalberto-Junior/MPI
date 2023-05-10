%%Considere a seguinte situac¸ao e responda ˜ as al ` ´ıneas abaixo:
%Um aluno do primeiro ano de um curso de Engenharia tem todas as semanas 2 aulas Teorico-Pr ´ aticas de ´
%uma Unidade Curricular X as 9:00, ` as quartas e sextas. `
%Todos os dias que tem aulas desta UC, o aluno decide se vai a aula ou n ` ao da seguinte forma: Se tiver ˜
%estado presente na aula anterior a probabilidade de ir a aula ` e 70%; se faltou ´ a anterior, a probabilidade `
%de ir e 80%. 
%%
% 2 estados: P--> presente; F --> Falta; 


T = [0.7 0.8
    0.3 0.2]; %matriz de trasição de estados
%%
%(a) Se estiver presente na aula de quarta numa determinada semana, qual a probabilidade de estar
%presente na aula de quarta da semana seguinte?
%Sugestao: Comece por definir a matriz de transição de estados e o vetor estado correspondentes.
V = [1 0]';
Aula1 = V;
Aula2 = T * Aula1;
Aula3 = T * Aula2;
Resposta = Aula3(1)

%%
%Se nao estiver presente na aula de quarta numa determinada semana, qual a probabilidade de estar ˜
%presente na aula de quarta da semana seguinte?
Aula1B = [0
          1];
Aula3B = T^2 * Aula1B;
respostab = Aula3B(1)

%%
%Sabendo que esteve presente na primeira aula, qual a probabilidade de estar na ultima aula, assu- ´
%mindo que o semestre tem exactamente 15 semanas de aulas e nao existem feriados?

UltimaAula = T^29 * Aula1;
RespostaC = UltimaAula(1)
%%
%%(d) Represente num grafico a probabilidade de faltar a cada uma das 30 aulas, assumindo que a proba- ´
%bilidade de estar presente na primeira aula e de 85%.
%Estado inicial:
pPresente = 0.85
v1 = [pPresente 
    1-pPresente]
n_aulas = 30
keepF = zeros(1,n_aulas);
keepF(1) = v1(2);
for i = 2:n_aulas
    aulasFaltadas = T^i * v1;
    keepF(i) = aulasFaltadas(2);
end
%keepF(1) = aulasFaltadas(2)
%fprintf("faltou em , %4.4f",keepF(30));
x = 1:n_aulas;
plot(x,keepF)