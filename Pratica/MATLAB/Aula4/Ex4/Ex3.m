% Co´digo base para detec¸a˜o de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes

% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); 
clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Nu´mero de utilizadores

% Constro´i a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa ce´lulas

for n = 1:Nu  % Para cada utilizador

% Obte´m os filmes de cada um
ind = find(u(:,1) == users(n));

% E guarda num array. Usa ce´lulas porque utilizador tem um nu´mero
% diferente de filmes. Se fossem iguais podia ser um array

Set{n} = [Set{n} u(ind,2)];

end

%4 PL 4. ALGORITMOS PROBABIL´ISTICOS

%% Calcula a distaˆncia de Jaccard entre todos os pares pela definic¸a˜o.
J=zeros(Nu,Nu); % array para guardar distaˆncias
h= waitbar(0,'Calculating');
tic
for n1= 1:Nu
    waitbar(n1/Nu,h);

for n2= n1+1:Nu
    %% Adicionar co´digo aqui
      u1 = Set{n1,:};
      u2 = Set{n2,:};
    intcer = length(intersect(u1,u2));
    uniao = length(union(u1,u2));
    dj = 1 - (intcer / uniao);
    J(n1) = dj;
end

end
toc
delete (h)
%% Com base na distaˆncia, determina pares com
%% distaˆncia inferior a um limiar pre´-definido
threshold = 0.4; % limiar de decisa˜o nargin
% Array para guardar pares similares (user1, user2, distaˆncia)
SimilarUsers= zeros(1,3);
k= 1;
tic
for n1= 1:Nu
    for n2= n1+1:Nu
        distancias = J(n1,n2);
        if distancias < threshold
            SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
toc
imagesc(J)
colormap summer
colorbar

