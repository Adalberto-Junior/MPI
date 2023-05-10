%Suponha que o(s) motor(es) de um aviao pode(m) falhar com probabilidade ˜ p e que as falhas sao in- ˜
%dependentes entre motores. Suponha ainda que o aviao se despenha se mais de metade dos motores ˜
%falharem. Nestas condicões, prefere voar num avi ˜ ao com ˜ 2 ou 4 motores? Utilize a distribuic¸ao que ˜
%considerar mais adequada
p = logspace(-2,log(1/2),10);
k = 2;
n = 2;
%p3 = nchoosek(n,k).p^k*(1-p)^n-k
p2 = zeros(1,10)
for i = 1:10
    p2(i) = p(i)^2;
    %p2(i) = nchoosek(n,k)*(p(i))^k*(1-(p(i)))^n-k
end
p4 = zeros(1,10);
for k = 1:10
    p4(k) = 4*p(k)^3-3*p(k)^4
end
pescola = p4./p2

%p3 = nchoosek(n,k).*p^k*(1.-p)^n-k
 %tabela = zeros(4:10)
tabela = table(p,p2,p4,pescola)

 