% a state transition matrix example
H = [0.5 0.5 0;
     0.5 0.4 0;
     0   0.1 1];
% how to use crawl()
state = crawl(H, 1, 2);

T = [0.8  0  0.3 0 0
     0.2 0.6 0.2 0 0
      0  0.1 0.4 0 0
      0  0.3  0  1 0
      0   0  0.1 0 1];


%Dados: 1 1 2 4 
%X = [T(1:1) T(2) T(2) T(4:4,2)] 

%Duvida!
%(a) Confirme os valores calculados nas al´ıneas (f) e (g) atraves de simulac¸ ´ ao (fac¸a a m ˜ edia de v ´ arias ´
%simulac¸oes). Use o c ˜ odigo Matlab na ´ ultima p ´ agina como base para criar a suas simulac¸ ´ oes.
%R * F
n_passos_Antes_Abs = 0;
n_passos_Antes_Abs_st2 = 0;
n_passos_Antes_Abs_st3 = 0;
m_Abs_estado4 = 0;
m_Abs_estado5 = 0;
N = 100;
for i = 1:N
    [state1] =  crawl(T,1,[4 5]);
    n_passos_Antes_Abs = n_passos_Antes_Abs + length(state1) -1;
    if (state1(end) == 4)
        m_Abs_estado4 = m_Abs_estado4+1;
    end
    if (state1(end) == 5)
        m_Abs_estado5 = m_Abs_estado5+1;
    end
end
for i = 1:N
    [state1] =  crawl(T,2,[4 5]);
    n_passos_Antes_Abs_st2 = n_passos_Antes_Abs_st2 + length(state1) -1;
end
for i = 1:N
    [state1] =  crawl(T,3,[4 5]);
    n_passos_Antes_Abs_st3 = n_passos_Antes_Abs_st3 + length(state1) -1;
end
p_m_Abs_estado5 = m_Abs_estado5 / N;
p_m_Abs_estado4 = m_Abs_estado4 / N;
%6f)
fprintf("6.F):\n")
fprintf("A media (valor esperado) do número de passos antes da absorção começando no estado 1 é de %d \n", n_passos_Antes_Abs)
fprintf("A media (valor esperado) do número de passos antes da absorção começando no estado 2 é de %d \n", n_passos_Antes_Abs_st2)
fprintf("A media (valor esperado) do número de passos antes da absorção começando no estado 4 é de %d \n", n_passos_Antes_Abs_st3)
%6g)
fprintf("\n")
fprintf("6.G):\n")
fprintf("Começando no estado 1, a probabilidade de absorção do estado 3 é %f\n",p_m_Abs_estado4);
fprintf("Começando no estado 1, a probabilidade de absorção do estado 5 é %f\n",p_m_Abs_estado5);

%(b) Guarde numa variavel do tipo cell array do Matlab 10000 sequ ´ encias que comec¸am num dos estados ˆ
%nao absorventes (escolhido com igual probabilidade). Calcule os comprimentos m ˜ ´ınimo e maximo ´
%das sequencias geradas. 

lista = cell(N,1);
comprimento = zeros(N);
for i = 1:N
    lista{i} = crawl(T, randi([1 3],1,1),[4 5]);
    comprimento(i) = length(lista{i}) - 1;
end
maximo = max(comprimento);
minimo = min(comprimento);
fprintf("\n")
fprintf("1b):\n")
fprintf("Maximo comprimento = %d\n",max(maximo));
fprintf("Minimmo comprimento = %d\n",max(minimo));

