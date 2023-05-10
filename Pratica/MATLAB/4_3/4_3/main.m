%% 
[Set, Nu] = ler('u.data');
%% 
J = distanciaJaccard(Set, Nu);
imagesc(J)

% Com base na distancia, determina pares com
% distancia inferior a um limiar pre-definido
%% 
SimilarUsers = pares(J, Nu, users);
SimilarUsers
