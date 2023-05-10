
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Ler os ficheiros 
%% u.data:
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
%% users.txt
dic = readcell('users.txt', 'Delimiter', ';'); %informações tiradas do users.txt
%% filme_info.txt
dic2 = readcell('film_info.txt', 'Delimiter', '\t'); %informações tiradas do film_info.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% processar os dados 
%%udata

u= udata(1:end,1:3); clear udata;
users = unique(u(:,1)); 
Nu= length(users); 

set = cell(Nu,1);
idFil_Aval = cell(Nu,1);   % conjunto para guardar id de filmes e avaliações de cada user

for n = 1:Nu  % Para cada utilizador

    ind = u(:,1) == users(n);
    set{n} = [set{n} u(ind,2)];
    idFil_Aval{n} = [idFil_Aval{n} u(ind,2) u(ind,3)];
end

%% dic

interesses = {}; % conjunto de interreses de cada users
Id_Name = {}; %Conjunto com id e nome dos users
for j = 1:Nu
    for k=4:length(dic(j,:))
       interesses{j,k-3} = dic{j,k}; 
    end
    for i = 1:2
        Id_Name{j,i} = dic{j,i};
    end
end


%% dic2

titulos = {}; % conjunto de titulo dos filmes
for j = 1:length(unique(u(:,2)))
       titulos{j,1} = lower(dic2{j,1}); 
   
end

id_Fil = unique(u(:,2));
id_name_fil = cell(size(titulos));
for n = 1:id_Fil  % Para cada utilizador
    id_name_fil{n} = [id_name_fil{n} {id_Fil(n) titulos{n}}]; %ver isso aqui
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MinHash:
kf = 100;
MinHasUseAv = inf(Nu,kf);
for n1 = 1:Nu
    conjunto = set{n1};
    for i = 1:length(conjunto)
         hash = zeros(1,kf) ;
         chv = char(conjunto(i));
    for hf = 1:kf
            chv = [chv num2str(hf)];
            hash(hf) = DJB31MA(chv,hf);
    end
        MinHasUseAv(n1,:) = min([MinHasUseAv(n1,:); hash]);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Minhash conjunto de interesses

shingSiz=3;
kf = 150;  % Número de funções de dispersão
MinHasUseIntrs = inf(length(dic),kf);
siz = size(interesses);
for n1 = 1:length(dic)
    for x = 1: siz(2)
        conjunto = interesses{n1,x};
        if ~(ismissing(conjunto))
            shingles = {};
            for j= 1 : length(conjunto) - shingSiz+1  % Criando shingles para cada filme
                shingle = conjunto(j:j+shingSiz-1);
                shingles{j} = shingle;
            end
            
            for j = 1:length(shingles)
                chav = char(shingles(j));
                hash = zeros(1,kf);
                for hf = 1:kf
                    chav = [chav num2str(hf)];
                    hash(hf) = DJB31MA(chav,hf);
                end
                MinHasUseIntrs(n1,:) = min([MinHasUseIntrs(n1,:);hash]);  
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Minhash conjunto de titulos:
%shingSiz=3;
kf = 150;  % Número de funções de dispersão
MinHasFilmTitul = inf(length(dic2),kf);
for i = 1:length(dic2)
    conjunto = titulos{n1};
    shingles = {};
    for j= 1 : length(conjunto) - shingSiz+1  % Criando shingles para cada filme
        shingle = conjunto(j:j+shingSiz-1);
        shingles{j} = shingle;
    end
    
    for j = 1:length(shingles)
        chav = char(shingles(j));
        hash = zeros(1,kf);
        for hf = 1:kf
            chav = [chav num2str(hf)];
            hash(hf) = DJB31MA(chav,hf);
        end
        MinHasFilmTitul(i,:) = min([MinHasFilmTitul(i,:);hash]);  
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Countinh Bloom Filter

%Inicializar o Counter Bloom Filter:
n = 10000;
m = 1682;%numero de filmes
khf = uint8((n * 0.693)/m); % k hash function

B = zeros(1,n,"uint8");  % Inicializar o Bloom

%construir o countih
for n1 = 1:Nu
    conjunto = idFil_Aval{n1};
    for i = 1:length(conjunto)
        if conjunto(i,2) >= 3
            Filtro = add(B,titulos{i},khf);
            B = Filtro;
        end
    end
end

save ('dados', 'dic', 'dic2', 'Id_Name', 'interesses', 'idFil_Aval', 'titulos', 'users', 'set', 'MinHasUseIntrs', 'MinHasUseAv', 'MinHasFilmTitul', 'Filtro', 'khf')
%Adicionar o elemento
function F = add(B,elemento,k)
key = elemento;

for i =  1:k
     key = [key num2str(i)];
     hash = string2hash(key);
     hash = rem(hash,length(B))+1;
     B(hash) = B(hash) +  1;
end
F = B;
return
end

