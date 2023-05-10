%1. Crie uma func¸ao para gerar chaves constitu ˜ ´ıdas por caracteres. O comprimento (i.e., o numero de ca- ´
%racteres) de cada chave deve ser escolhido aleatoriamente (distribuic¸ao uniforme) entre ˜ imin e imax. A
%func¸ao deve ter como par ˜ ametros de entrada o n ˆ umero ´ N de chaves a gerar, os valores de imin e imax, um
%vector com os caracteres a usar nas chaves e um vector com as probabilidades de cada um dos caracteres
%a utilizar. Se a func¸ao for chamada sem o ˜ ultimo par ´ ametro, deve considerar os caracteres equiprov ˆ aveis ´
%(ver a documentac¸ao da func¸ ˜ ao˜ nargin).

%%
%(a) Gere um conjunto de N = 10^5 chaves usando todas as letras maiusculas e
%minúsculas ( 'A' a 'Z' e ’a’ a ’z’) com igual probabilidade e em que imin = 6 e imax = 20
N = 1e5;
imin = 6;
imax = 20;
symb = ['a':'z' 'A':'Z'];
word = genarate(N, imin,imax,symb);
for i = 1:N
fprintf("%2d - Word: %s de comprimento: %d\n",i, word{i}, length(word{i}));
end

