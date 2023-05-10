%2. Considere a func¸ao Matlab ˜ string2hash()1 que implementa duas func¸oes de dispers ˜ ao diferentes. ˜
%Considere ainda 2 func¸oes Matlab fornecidas que s ˜ ao adaptac¸ ˜ oes para Matlab das func¸ ˜ oes de dispers ˜ ao˜
%hashstring()2 e DJB31MA()3.
%Utilizando separadamente cada uma destas quatro func¸oes de dispers ˜ ao, simule a inserc¸ ˜ ao das chaves ˜
%criadas no exerc´ıcio 1a) em 3 Chaining Hash Tables, uma de tamanho 5 ×105 , outra de tamanho 106
%e a terceira de tamanho 2 × 106 . Para cada uma das simulac¸oes (4 func¸ ˜ oes de dispers ˜ ao˜ × 3 tamanhos):

%%
%gerar chaves
N = 1e5;
imin = 6;
imax = 20;
symb = ['a':'z' 'A':'Z'];
word = genarate(N, imin,imax,symb);

%sizewor = size(word);
%%
%T = 1e3
fprintf("dados de T = 10^3\n");
T = 1e3; %tamande palavras
hashcodes_S = zeros(1,T);
num_atribuicoes = zeros(1,T);

for i = 1:T
    tic 
    %word{i}
    hash= string2hash(word{i});
    hash = rem(hash,T)+1;
    hashcodes_S(i) = hash;
    num_atribuicoes(hash) = num_atribuicoes(hash)+1;
end
    toc;
n_colisoes = sum(num_atribuicoes > 1);
fprintf("Números de colisões: %d\n",n_colisoes);
fprintf("Números de colisões: %d\n",n_colisoes);
%figure(1)
subplot(4,3,1)
histogram(hashcodes_S,100)
fprintf("\n")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de hashstring:\n")
hascodeshastr  = zeros(1,T);
num_atribuicoes_s = zeros(1,T);

for i = 1:T
    tic 
    %word{i}
    hash= hashstring (word{i},T);
    hash = rem(hash,T)+1;
    hascodeshastr(hash) = hash;
    num_atribuicoes_s(hash) = num_atribuicoes_s(hash)+1;
end
    toc;
n_colisoes_s = sum(num_atribuicoes_s > 1);
fprintf("Números de colisões: %d\n",n_colisoes_s);
%figure(1,"Name",2)
subplot(4,3,2)
histogram( hascodeshastr,100)
fprintf("\n")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de  DJB31MA:\n")
hascodesd_DJ = zeros(1,T);
num_atribuicoes_DJ = zeros(1,T);

for i = 1:T
    tic 
    %word{i}
    hash= DJB31MA(word{i},T);
    hash = rem(hash,T)+1;
    hascodesd_DJ(i) = hash;
    num_atribuicoes_DJ(hash) = num_atribuicoes_DJ(hash)+1;
end
    toc;
n_colisoes_DJ = sum(num_atribuicoes_DJ > 1);
fprintf("Números de colisões: %d\n",n_colisoes_DJ);
%figure(1,3)
subplot(4,3,3)
histogram(hascodesd_DJ,100)
fprintf("\n")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%T = 5 * 10^5
fprintf("______________________________________________________\n")
fprintf("dados de T = 5 * 10^5\n")
T1 = 5 * 1e5;
word = genarate(T1, imin,imax,symb);
%wordsiz = size(word);
hashcodes1 = zeros(1,T1);
num_atribuicoesT1 = zeros(1,T1);

for i = 1:T1
    tic 
    %word{i}
    hash = string2hash(word{i});
    hash = rem(hash,T1)+1;
    hashcodes1(i) = hash;
    num_atribuicoesT1(hash) = num_atribuicoesT1(hash)+1;
end
    toc
n_colisoesT1 = sum(num_atribuicoesT1 > 1);
fprintf("Números de colisões: %d\n",n_colisoesT1);
fprintf("\n")
subplot(4,3,4)
histogram( hashcodes1,100)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de hashstring:\n")
hascodeshastrT1  = zeros(1,T1);
num_atribuicoes_s1T1 = zeros(1,T1);

for i = 1:T1
    tic 
    %word{i}
    hash= hashstring (word{i},T1);
    hash = rem(hash,T1)+1;
   hascodeshastrT1(i) = hash;
   num_atribuicoes_s1T1(hash) = num_atribuicoes_s1T1(hash)+1;
end
    toc;
n_colisoes_sT1 = sum(num_atribuicoes_s1T1 > 1);
fprintf("Números de colisões: %d\n",n_colisoes_sT1);
fprintf("\n")
subplot(4,3,5)
histogram(  hascodeshastrT1,100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de  DJB31MA:\n")
hascodesd_DJT1 = zeros(1,T1);
num_atribuicoes_DJT1 = zeros(1,T1);

for i = 1:T1
    tic 
    %word{i}
    hash= DJB31MA(word{i},T1);
    hash = rem(hash,T1)+1;
    hascodesd_DJT1(i) = hash;
    num_atribuicoes_DJT1(hash) = num_atribuicoes_DJT1(hash)+1;
end
    toc;
n_colisoes_DJT1 = sum(num_atribuicoes_DJT1 > 1);
fprintf("Números de colisões: %d\n",n_colisoes_DJT1);
fprintf("\n")
subplot(4,3,6)
histogram(hascodesd_DJT1,100)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%T = 10^6 
fprintf("______________________________________________________\n")
fprintf("dados de T = 10^6\n");
T2 = 1e6;
word = genarate(T2, imin,imax,symb);
%wordsiz = size(word);
hashcodes2 = zeros(1,T2);
num_atribuicoesT2 = zeros(1,T2);

for i = 1:T2
    tic 
    %word{i}
    hash= string2hash(word{i});
    hash = rem(hash,T2)+1;
    hashcodes2(i) = hash;
    num_atribuicoesT2(hash) = num_atribuicoesT2(hash)+1;
end
    toc

n_colisoesT2 = sum(num_atribuicoes > 1);
fprintf("Números de colisões: %d\n",n_colisoesT2);
fprintf("\n");
subplot(4,3,7)
histogram(hashcodes2,100)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de hashstring:\n")
hascodeshastrT2  = zeros(1,T2);
num_atribuicoes_s1T2 = zeros(1,T2);

for i = 1:T2
    tic 
    %word{i}
    hash= hashstring (word{i},T2);
    hash = rem(hash,T2)+1;
   hascodeshastrT2(i) = hash;
   num_atribuicoes_s1T2(hash) = num_atribuicoes_s1T2(hash)+1;
end
    toc;
n_colisoes_sT2 = sum(num_atribuicoes_s1T2 > 1);
fprintf("Números de colisões: %d\n",n_colisoes_sT2);
fprintf("\n")
subplot(4,3,8)
histogram(hascodeshastrT2,100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de  DJB31MA:\n")
hascodesd_DJT2 = zeros(1,T2);
num_atribuicoes_DJT2 = zeros(1,T2);

for i = 1:T2
    tic 
    %word{i}
    hash= DJB31MA(word{i},T2);
    hash = rem(hash,T2)+1;
    hascodesd_DJT2(i) = hash;
    num_atribuicoes_DJT2(hash) = num_atribuicoes_DJT2(hash)+1;
end
    toc;
n_colisoes_DJT2 = sum(num_atribuicoes_DJT2 > 1);
fprintf("Números de colisões: %d\n",n_colisoes_DJT2);
fprintf("\n")
subplot(4,3,9)
histogram(hascodesd_DJT2,100)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
%T = 2 * 10^6
fprintf("______________________________________________________\n")
fprintf("dados de T = 2 * 10^6\n");
T3 = 2 * 1e6;
word = genarate(T3, imin,imax,symb);
%wordsiz = size(word);
hashcodes3 = zeros(1,T3);
num_atribuicoesT3 = zeros(1,T3);

for i = 1:T3
    tic 
    %word{i}
    hash= string2hash(word{i});
    hash = rem(hash,T3)+1;
    hashcodes3(i) = hash;
    num_atribuicoesT3(hash) = num_atribuicoesT3(hash)+1;
end
    toc
n_colisoesT3 = sum(num_atribuicoesT3 > 1);
fprintf("Números de colisões: %d\n",n_colisoesT3);
fprintf("\n")
subplot(4,3,10)
histogram(hashcodes3,100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de hashstring:\n")
hascodeshastrT3  = zeros(1,T3);
num_atribuicoes_s1T3 = zeros(1,T3);

for i = 1:T3
    tic 
    %word{i}
    hash= hashstring (word{i},T3);
    hash = rem(hash,T3)+1;
   hascodeshastrT3(i) = hash;
   num_atribuicoes_s1T3(hash) = num_atribuicoes_s1T3(hash)+1;
end
    toc;
n_colisoes_sT3 = sum(num_atribuicoes_s1T3 > 1);
fprintf("Números de colisões: %d\n",n_colisoes_sT3);
fprintf("\n")
subplot(4,3,11)
histogram(hascodeshastrT3,100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Dados de  DJB31MA:\n")
hascodesd_DJT3 = zeros(1,T3);
num_atribuicoes_DJT3 = zeros(1,T3);

for i = 1:T3
    tic 
    %word{i}
    hash= DJB31MA(word{i},T3);
    hash = rem(hash,T3)+1;
    hascodesd_DJT3(i) = hash;
    num_atribuicoes_DJT3(hash) = num_atribuicoes_DJT3(hash)+1;
end
    toc;
n_colisoes_DJT3 = sum(num_atribuicoes_DJT3 > 1);
fprintf("Números de colisões: %d\n",n_colisoes_DJT3);
fprintf("\n")
subplot(4,3,12)
histogram(hascodesd_DJT3,100)

fprintf("__________________________FIM_________________________\n")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

