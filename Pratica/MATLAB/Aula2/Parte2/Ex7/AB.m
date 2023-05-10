%7. Suponha que o numero de mensagens que chega a um servidor de ´ email segue uma lei de Poisson com
%media de 15 (mensagens por segundo). Calcule a probabilidade de num intervalo de um segundo: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) o servidor nao receber nenhuma mensagem;
lanbda = 15;
k = 0;
Ppoisson = ((lanbda^k)/factorial(k))*exp(-lanbda)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(b) o servidor receber mais de 10 mensagens.
k1 =  11
Ppoisson10 =  ((lanbda^k1)/factorial(k1))*exp(-lanbda)
complimentarP = zeros(1,11);
for i = 0:10
    PpoissonR =  ((lanbda^i)/factorial(i))*exp(-lanbda);
    complimentarP(i+1) = PpoissonR;
end
ProbabilidadMenor10 = sum(complimentarP);
ProbabilidadMais10 = 1 - ProbabilidadMenor10

