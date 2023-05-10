%A distribuic¸ao de Poisson ˜ e uma forma limite da distribuic¸ ´ ao binomial (quando ˜ n → ∞ , p → 0 e np
%permanece constante) e portanto pode ser usada para aproximar e simplificar os calculos envolvidos com ´
%a binomial em situac¸oes em que as condic¸ ˜ oes anteriores se verifiquem. ˜
%Num processo industrial de fabrico de chips, alguns aparecem defeituosos tornando-os inapropriados
%para comercializac¸ao. ˜ E sabido que em m ´ edia por cada 1000 chips h ´ a um defeituoso. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%E[Binomial] = n * p
%n*p = landa ---> e a media de poisson é landa;

%a)Usando a distribuic¸ao binomial, determine a probabilidade de numa amostra de ˜ 8000 chips 
% aparecerem 7 defeituosos.
N = 1e5;
n = 8000;
p = 0.001;
k = 7;
%producao = rand(n,N) < p;
%sucessos = sum(producao) == 7;
%proba = sum(sucessos)/N
probBinomial = nchoosek(n,k)*p^k*(1-p)^(n-k)
%poissoon
lanbda = n*p;
probPoisson = ((lanbda^k)/factorial(k)) * exp(-lanbda)  