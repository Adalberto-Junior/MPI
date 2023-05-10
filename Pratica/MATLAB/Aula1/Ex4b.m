%(b) Fac¸a um grafico, usando a func¸ ´ ao˜ stem, das probabilidades estimadas no caso de 20 lanc¸amentos.
N = 1e5;
n = 20;
p = 0.5;
t = zeros(1, n+1)
for k = 0:n
    t(k+1) = prob(p,n,k,N);
end
plot(0:n,t)