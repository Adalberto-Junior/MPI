


%ler o ficheiro:
[Set,users,Nu] = read_data('u.data');
k = 100;
%h= waitbar(0,'Calculating');
MinHashValue = inf(Nu,k);
J = zeros(Nu);
tic
for n1 = 1:Nu
    conjunto = Set{n1};
    for i = 1:length(conjunto)
         hash = zeros(1,k) ;
         chave = char(conjunto(i));
    for hf = 1:k
        %waitbar(n1/Nu,h);
        %chave = (conjunto(j));
            chave = [chave num2str(hf)];
            hash(hf) = DJB31MA(chave,hf);
    end
        %Assinatura(n1,:) = min(hash);
         %Assinatura(n1,:) = min(hash);
        MinHashValue(n1,:) = min([MinHashValue(n1,:); hash]);
    end
end
 %chave = [chave num2str(kk)];
  %          hash(kk) = DJB31MA(chave, kk);
fprintf("o Tempo levado para calcular a assinatura(minhash) é de %f \n",toc)
%delete(h)
%distancia de jacard: 
%J=zeros(Nu,Nu); % array para guardar distaˆncias
h= waitbar(0,'Calculating');
tic
for n1= 1:Nu
    waitbar(n1/Nu,h);
for n2= n1+1:Nu
    %% Adicionar co´digo aqui
   num  = sum(MinHashValue(n1,:) == MinHashValue(n2,:));
   J(n1,n2) = 1 - (num/k);
end
end
save 'J.txt' J
delete (h)
fprintf("o Tempo levado para calcular a distancia de jacard dado por minhash é de %f \n",toc)

%Similaridade usando distancia dado por minhash
tic
threshold = 0.4;
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

fprintf("o Tempo levado para calcular a similaridade usando a distancia de jacard dado por minhash é de %f \n",toc)
fprintf('Num pares mais similares= %d\n',size(SimilarUsers,1));
SimilarUsers
%imagesc(J)
%colormap(hot)
%colormap('gray')
%colorbar

