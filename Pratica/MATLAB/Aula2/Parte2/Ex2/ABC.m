%2. Considere uma caixa contendo 90 notas de 5 Euros, 9 notas de 50 e 1 de 100.

%(a) Descreva o espac¸o de amostragem da experiencia aleat ˆ oria, retirar uma nota da caixa, e as proba- ´
%bilidades dos acontecimentos elementares.
S = 1:100;


%%(b) Considere agora a variavel aleat ´ oria ´ X como sendo o valor de uma nota retirada a sorte da caixa `
%acima descrita. Descreva o espac¸o de amostragem e a func¸ao massa de probabilidade de ˜ X.
X = [5 50 100];
x = [90 9 1];
PX = ones(size(x))/100;

%(c) Determine a func¸ao distribuic¸ ˜ ao acumulada de ˜ X e efectue a sua representac¸ao gr ˜ afica em Matlab.

fx = cumsum(PX);
stairs(X, fx)