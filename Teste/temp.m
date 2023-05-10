%%Minhash conjunto de titulos:
MinHasFilmTitul = inf(Nu,kf);
for n1 = 1:length(unique(u(:,2)))
        conjunto = titulos{n1};
        for i = 1:length(conjunto)
             hash = zeros(1,kf) ;
             chav = (conjunto(i));
        for hf = 1:kf
                chav = [chav num2str(hf)];
                hash(hf) = string2hash(chav);
        end
            MinHasFilmTitul(n1,:) = min([MinHasFilmTitul(n1,:); hash]);
        end
  
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ismissing(conjunto2)
    fprintf("2\n")
else
    fprintf("1\n")
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Minhash conjunto de interesses

siz = size(interesses)
MinHasUseIntrs = inf(Nu,kf);
for n1 = 1:Nu
    for x = 1: siz(2)
        conjunto = interesses{n1,x};
        for i = 1:length(conjunto)
             hash = zeros(1,kf) ;
             chav = (conjunto(i)); %%resolver os missing
        for hf = 1:kf
                chav = [chav num2str(hf)];
                hash(hf) = string2hash(chav);
        end
            MinHasUseIntrs(n1,:) = min([MinHasUseIntrs(n1,:); hash]);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
function F = add(B,elemento,k)
%function B = add(n,k)
 
key = elemento;

for i =  1:k
     key = [key char(i)];
     hash = string2hash(key);
     hash = rem(hash,length(B))+1;
     B(hash) = 1;
end
F = B;
return
end

function r = ismember(B,elemento,k)

%i = 1;
%sizB = size(B);
%member = zeros(1,k);
member = zeros(1,k);
key = elemento;
for i = 1:k
    key  = [key char(i)];
    hash = string2hash(key);
    hash = rem(hash,length(B))+1;
    member(i) = B(hash);
end
%
%while 1
     
     
 %   if (i == k || B(hash) == 0 )
  %      break
   % end
    % i = i +1;
%end
if sum(member) == k
    r=true;
    
else
    r=false;
end
end


function B = init_bloom(nbits,k)

    B = zeros(1,nbits,"uint8");
return 
end


idFil_Aval = cell(Nu,1);   % conjunto para guardar id de filmes e avaliações de cada user
for n = 1:Nu  % Para cada utilizador

    ind = u(:,1) == users(n);
    idFil_Aval{n} = [ u(ind,2) u(ind,3)];
end
