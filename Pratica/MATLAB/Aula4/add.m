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