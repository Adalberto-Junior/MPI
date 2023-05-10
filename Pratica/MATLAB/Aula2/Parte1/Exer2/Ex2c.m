m = 1000;
n = 20;
N = 1e5;
ns = 10:10:100;
res = zeros(1, length(ns))
M = randi(m,n,N);
diferentes = zeros(1,N);
%for  
for col = 1:N
   diferentes(col) = length(unique(M(:,col))) == n;
end
%end

p1 = sum(diferentes)/N;
p2 = 1-p1;
%fprintf('Alinea a): probabilidade = %.6f\n',p1)
%fprintf('Alinea b): probabilidade = %.6f\n',p2)
