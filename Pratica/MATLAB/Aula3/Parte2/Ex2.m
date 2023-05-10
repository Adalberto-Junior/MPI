%2. Considere sequencias de d ˆ ´ıgitos ´ımpares de 1 a 9 com as seguintes propriedades:
%• todas as sequencias comec¸am por ˆ 9;
%• na segunda posic¸ao da sequ ˜ encia podemos ter ˆ 1 ou 3, com igual probabilidade;
%• na terceira posic¸ao e seguintes podem aparecer os d ˜ ´ıgitos 3, 5 e 9;
%• os in´ıcios de sequencia ˆ 913, 915 e 919 sao equiprov ˜ aveis; ´
%• da segunda para a terceira posic¸oes a transic¸ ˜ ao de ˜ 3 para 5 tem probabilidade 0.6 e nao˜ e poss ´ ´ıvel
%a transic¸ao de ˜ 3 para 3;
%• da terceira posic¸ao em diante as probabilidades s ˜ ao as assinaladas na figura abaixo. ˜

%(a) Complete o diagrama de estados abaixo (incompleto!...) relativo a cadeia de Markov correspon- `
%dente indicando todos os estados e transic¸oes poss ˜ ´ıveis segundo o enunciado. Crie em Matlab a
%matriz de transic¸ao de estados ( ˜ T) correspondente.
   % 9  1   3  3   5  9   FIM 
T =[ 0 1/2 1/2 0  0   0   0     %9
     0  0  0  1/3 1/3 1/3 0     %1
     0  0  0   0  0.6 0.4 0     %3
     0  0  0  0.2 0.5  0  0.3   %3
     0  0  0  0.1 0.4 0.3 0.2   %5
     0  0  0   0  0.3 0.3 0.4   %9
     0  0  0   0    0  0   0]'   %FIM

%(b) Qual a probabilidade de uma sequencia de ˆ 7 d´ıgitos iniciada por 91 e terminada em 9 ?
    %state = crawl(T, 1, 6)

    %Duviva!
    px1_9 = 1;
    p91 = T(2,1);
    T5 = T^5;
    Px7_9s1 = T5(6,2);
    Px8_FIM_s_x7_9 = T(7,6);
    p_seq_7_d_91_xxx_9 = px1_9 * p91 * Px7_9s1 * Px8_FIM_s_x7_9;
   
% (c) Qual a probabilidade de sequências de 7 dígitos iniciadas por 91?
    p_9 = 1;
    p_91 = T(2,1);
    T6 = T^6;
    Px8_FIM_s_x2_1 = T6(7,2);
    p_seq_7_d_91_xxx = p_9 * p_91 * Px8_FIM_s_x2_1;

    fprintf("A probabilidade de uma sequencia de 7 dígitos iniciada por 91 e terminada em 9 é %f\n",p_seq_7_d_91_xxx_9)
    fprintf("A probabilidade de uma sequencia de 7 dígitos iniciada por 91 é %f\n",p_seq_7_d_91_xxx)

