%%2. Considere o seguinte “jogo”: lanc¸amento com os olhos vendados de n dardos, um de cada vez, para m
%%alvos, garantindo-se que cada dardo atinge sempre um alvo (e apenas 1).
m = 100;
n = 20;
N = 1e5;
M = randi(m,n,N);
diferentes = zeros(1,N);
for col = 1:N
   diferentes(col) = length(unique(M(:,col))) == n;
end
p1 = sum(diferentes)/N;
p2 = 1-p1;
fprintf('Alinea a): probabilidade = %.6f\n',p1)
fprintf('Alinea b): probabilidade = %.6f\n',p2)
