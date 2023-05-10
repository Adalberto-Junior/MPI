clear;
load("dados.mat") % todos os dados necessário
%main--> programa principal
prompt = "Insert Film ID (1 to 1682): ";
id = input(prompt);
op = 0;
while(op ~= 5)
         fprintf("\n")
         fprintf("1- Users that evaluated current movie\n")
         fprintf("2- Suggestion of users to evaluate movie\n")
         fprintf("3- Suggestion of users to based on common interests\n")
         fprintf("4- Movies feedback based on popularity\n")
         fprintf("5- Exit\n")
         prompt = "Select choice: ";
         op = input(prompt);
     switch(op)

        case 1
            listName(id,Id_Name,set);
        case 2
            listSuggestion(id,users,Id_Name,set,MinHasUseAv);
        case 3
            ListSuggetInterests(id,users,Id_Name,set,MinHasUseIntrs);
        case 4
            feedback(titulos,Filtro,MinHasFilmTitul,khf);
        case 5
            fprintf("Exit...\n")
        otherwise
            fprintf("Invalid choise! Try aguain\n")
     end
end

function listName(id,setName,setAll)
    fprintf("Users that evaluated this movie: ID = %d\n",id);
    fprintf("ID - NAME:\n");
        for n1 = 1:length(setName) % por cada users
            conjunto = setAll{n1}; %os filmes avaliados pelo mesmo
            for i = 1:length(conjunto)
                if conjunto(i) == id %se o mesmo avaliou o filme atual printa o id e o seu nome 
                    fprintf("%3d - %s\n",setName{n1,1},setName{n1,2});
                end
            end
        end
end

function listSuggestion(id,users,setName,setAll,minaHash)
     J = jacard(minaHash,length(setName)); % calcular a distancia de jacard
     SimilarUsers = similaridade(J,0.4,length(setName),users); %pares similares
         
     [maxSiliar ind] = max(SimilarUsers(:,3)); % os pares com maior similaridade e o seu indice
      maisSimilar  = SimilarUsers(ind,:);

     filmEvaUser1 = setAll{maisSimilar(1)}; %os filmes avaliados pelo user 1 dos pares
     filmEvaUser2 = setAll{maisSimilar(2)}; %os filmes avaliados pelo user 2 dos pares
     Suggestion = [];

     if ~ismember(filmEvaUser1,id) % se o user ainda não avaliou o atual filme
        Suggestion = [ Suggestion maisSimilar(1)];
     end
     if ~ismember(filmEvaUser2,id)
        Suggestion = [Suggestion maisSimilar(2)];
     end

     if isempty(Suggestion)
        fprintf("\nThere is no film suggestions.\n");
     else
        fprintf('\nSuggestions of users:\n');
        for i = 1:length(Suggestion)
            fprintf("%3d - %s\n",setName{Suggestion(i),1},setName{Suggestion(i),2})
       end
    end
end
function ListSuggetInterests(id,users,setName,setAll,minaHash)
        J = jacard(minaHash,length(setName)); % calcular a distancia de jacard
        threshold = 0.9;
        setId = {};
       
        for n1 = 1:length(setName) % por cada users
            conjunto = setAll{n1}; %os filmes avaliados pelo mesmo
            setId{n1} = [];
            for n2 = n1+1: length(setName)
                conjunto2 = setAll{n2};
                    if ~ismember(conjunto2,id)
                       if ismember(conjunto,id)
                            if J(n1,n2) < threshold
                                setId{n1} = [setId{n1} n2];
                            end
                        end
                    end
                end
            end
        NumOcors = [];
        for n1 = 1:length(setName)
            conjunto = setId{n1};
             ocorencias = [];
            for n2 = 1:length(conjunto)
                ocorencias(n2) = 0;
                for i = 1:length(conjunto)
                    if n2 == conjunto(i,1)
                        ocorencias(n2) = ocorencias(n2) + 1;
                        NumOcors(n2) = [NumOcors(n2) ocorencias(n2) ];
                    end
                end
            end
        end
      for i = 1:2
        [maxi, ind] = max(NumOcors);  % Calcular o valor maximo
        fprintf("%3d - %s\n",setName{ind,1},setName{ind,2})
        NumOcors(ind) = 0;  % Retirar 
     end     
end
function feedback(titulos,filtro,MinHashSig,khf)
    nome = lower(input('\nWrite the name : ', 's'));
    shin_size = 3;  %  o mesmo numero de shingles usado no processamento de dados
    kf = size(MinHashSig, 2);  % kf igual ao kf utilizado no processamento para os shingles dos titulos
       
    % Cell array com os shingles do nome introduzido
    shinglesNom = {};
    for i = 1:length(nome) - shin_size+1
        shingle = nome(i:i+shin_size-1);
        shinglesNom{i} = shingle;
    end

    % MinHash dos shingles do nome introduzido
    MinHashNome = inf(1,kf);
    for j = 1:length(shinglesNom)
        chave = char(shinglesNom{j});
        hash = zeros(1, kf);
        for hf = 1: kf
            chave = [chave num2str(hf)];
            hash(hf) = DJB31MA(chave, hf);
        end
        MinHashNome(1,:) = min([MinHashNome(1,:); hash]);
        
    end

    % Distancia de Jaccard entre a string e cada filme
    J = ones(1, length(titulos));  % array para guardar distancias
    h = waitbar(0,'Calculating');
    for i=1:length(titulos)  % cada hashcode da string
        waitbar(i/ kf, h);
        num = sum(MinHashSig(i,:) == MinHashNome);
        J(i) = 1 - (num/ kf);
    end
    delete(h);

    filme = false;  %para saber se houve algum filme encontrado com uma distancia menor ou igual a threshold

    for i = 1:3
        [maximo, ind] = max(J);  % Calcular o valor minimo (mais similaridade)
            filme = true;
            contador = contagem(filtro,titulos{ind,1},khf);
            fprintf('Filme: %s foi avaliado %d com nota superior ou igual a 3\n', titulos{ind,1}, contador);
        J(ind) = 0;  % Retirar esse filme dando uma distancia igual a 1 contagem(B,elemento,k)
    end
    
    if (~filme)
        fprintf('No movies found.\n');
    end
end
    
    
    %%distancia de Jacard
function J = jacard(MinHash,Nu)
    khf = 100; % o mesmo usado no processData
    J = zeros(Nu);
    h= waitbar(0,'Calculating');
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu
           num  = sum(MinHash(n1,:) == MinHash(n2,:));
           J(n1,n2) = 1 - (num/khf);
        end
    end
    delete (h)
end

%Similaridade usando distancia dado por minhash
function SimilarUsers = similaridade(J,threshold,Nu,users)
%threshold = 0.4;
    SimilarUsers = zeros(1,3);
    j = 1;
    for n1 = 1:Nu
        for n2 = n1+1: Nu
            if J(n1,n2) <= threshold
                SimilarUsers(j,:) = [users(n1) users(n2) J(n1,n2)];
                j = j+1;
            end
        end
    end
end

%% contagem()
function multipli = contagem(B,elemento,k)
    member = zeros(1,k);
    key = elemento;
    
    for i =  1:k
         key = [key num2str(i)];
         hash = string2hash(key);
         hash = rem(hash,length(B))+1;
         B(hash) = B(hash) +  1;
         member(i) = B(hash);
    end
    multipli = min(member);

end


