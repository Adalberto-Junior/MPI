%8. Assumindo que o numero de erros tipogr ´ aficos numa p ´ agina de um livro tem uma distribuic¸ ´ ao de Poisson ˜
%com λ = 0.02, calcule a probabilidade de que exista no maximo 1 erro num livro de 100 p ´ aginas. ´
%Considere que o numero de erros em cada p ´ agina ´ e independente do n ´ umero de erros nas outras p ´ aginas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda = 0.02; % uma pagina
Newlambda = lambda * 100; % um libro de 100 paginas
k = 0;
k1 = 1;
Ppoisson0 = ((Newlambda^k)/factorial(k)) * exp(-Newlambda);
Ppoisson1 = ((Newlambda^k1)/factorial(k1)) * exp(-Newlambda);
PpoissonTotal = Ppoisson0 + Ppoisson1 

