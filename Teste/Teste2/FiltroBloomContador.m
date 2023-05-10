%% Countinh Bloom Filter
idFil_Aval = cell(Nu,1);   % conjunto para guardar id de filmes e avaliações de cada user
for n = 1:Nu  % Para cada utilizador

    
    idFil_Aval{n} = [idFil_Aval{n} u(ind,2) u(ind,3)];
end

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
            F = add(B,titulos{i},khf); %titulos, é um cell array só com os titilos dos filmes, penso que está organizado por id do filme 
            B = F;
        end
    end
end


%Adicionar o elemento
function F = add(B,elemento,k)
%function B = add(n,k)
 
key = elemento;

for i =  1:k
     key = [key char(i)];
     hash = string2hash(key);
     hash = rem(hash,length(B))+1;
     B(hash) = B(hash) +  1;
end
F = B;
return
end
