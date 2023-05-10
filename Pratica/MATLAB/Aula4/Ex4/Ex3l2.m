[Set,users,Nu] = read_data('u.data');



%4 PL 4. ALGORITMOS PROBABIL´ISTICOS

%% Calcula a distaˆncia de Jaccard entre todos os pares pela definic¸a˜o.
J = distancia(Nu);
imagesc(J)

%% Com base na distaˆncia, determina pares com
%% distaˆncia inferior a um limiar pre´-definido
SimilarUsers = similaridade(J,Nu,users,0.2);


imagesc(J)
colormap("gray")
colorbar