%esta função verifica se é membro
%parametro:
%B--> filtro
%elemento->elemento a ser verificado
%k--> números de funções de dispersão

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
