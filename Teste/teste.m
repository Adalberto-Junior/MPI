T = [0 1/2 0 0 0 
     1/2 0 1/2 0 0
     0 1/2 0 0 0
     1/2 0 0 1 0
     0 0 1/2 0 1]

Q = T(1:3:1:3)
R = T(3:5:1:3)
I = eye(length(Q))
F = inv(I - Q)
%B = R * F
PmVisiApa1 = F(:,1)
t = sum(F) 
T = [7 8; 3 2]/10
s = size(T)
M = [(T - eye(length(T)));
        ones(1,s(2))]
 x = [0 0 1]'
 u = M\x

 sufer

  C = cell(2,3)
  C(1,1) = {'This does work'}



  letters='abcde';
% p=[0.0828 0.0084 0.0201 0.0342 0.0792]; % PT real
p=[0.800 0.01 0.01 0.01 0.17]; % fake
p=p/sum(p); % só existem para nós 5 letras
X= zeros(1,60);
for j=1:60
U=rand();
i = 1 + sum( U > cumsum(p) );
% out sera valor entre 1 e 5 
% de acordo com as probabilidades p
X(j)= letters(i);
end
char(X)
