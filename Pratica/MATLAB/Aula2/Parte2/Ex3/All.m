%3. Considere 4 lanc¸amentos de uma moeda equilibrada. Seja X a variavel aleat ´ oria representativa do ´
%numero de coroas observados nos ´ 4 lanc¸amentos.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    X = [ 0 1 2 3 4];
    %PX = ones(size(X))/4;
    N = 1e5;
    n = 4;
    p = 0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lancamentos = rand(n,N) > p;
    %caras = sum(M) > 0.5;
     PX = zeros(1, n + 1);
    for i = 0:n
        sucessos = sum(lancamentos) == i;
        PX(i + 1) = sum(sucessos)/N;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %(b) Estime o valor esperado, a variancia e o desvio padr ˆ ao de ˜ X com base em pX(x).
    media = sum(X.*PX);
    var = sum((X.^2).*PX) - media^2;
    %dp = sqrt(var)
    dp = var ^(1/2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %C) é a lei Binominial com n = 4, K = 0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %d) Calcule os valores teoricos da func¸ ´ ao massa de probabilidade de ˜ X e compare-os com os valores
    %estimados por simulac¸ao obtidos em (a).
    PXteorico = zeros(1, n+1);
     for k = 0:n
       pro = nchoosek(n,k)*p^k*(1-p)^(n-k);
       PXteorico(k+1) = pro;
     end
     fprintf('\n');
     fprintf('Valores por simulação:\n');
     fprintf('PX(0) = %4.4f ',PX(1));
     fprintf('PX(1) = %4.4f ',PX(2));
     fprintf('PX(2) = %4.4f ',PX(3));
     fprintf('PX(3) = %4.4f ',PX(4));
     fprintf('PX(4) = %4.4f\n',PX(5));

     fprintf('Valores teoricos:\n');
     fprintf('PX(0) = %4.4f ',PXteorico(1));
     fprintf('PX(1) = %4.4f ',PXteorico(2));
     fprintf('PX(2) = %4.4f ',PXteorico(3));
     fprintf('PX(3) = %4.4f ',PXteorico(4));
     fprintf('PX(4) = %4.4f \n\n',PXteorico(5));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %(e) Calcule os valores teoricos de ´ E[x] e de V ar(X) e compare-os com os valores obtidos em (b)
    mediaTeorico = sum(X.*PXteorico);
    varTeorico = sum((X.^2).*PXteorico) - mediaTeorico^2;
    %dp = sqrt(var)
    dpTeorico = varTeorico ^(1/2);

    fprintf('Valores por simulação:\n');
    fprintf('Media = %4.4f ',media);
    fprintf('Variâmcia = %4.4f ',var);
    fprintf('Disvio padrão = %4.4f \n',dp);

    fprintf('Valores teoricos:\n');
    fprintf('Media = %4.4f ',mediaTeorico);
    fprintf('Variâmcia = %4.4f ',varTeorico);
    fprintf('Disvio padrão = %4.4f \n\n',dpTeorico);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %(f) Com base nos valores teoricos da func¸ ´ ao massa de probabilidade desta distribuic¸ ˜ ao, calcule
    %i. a probabilidade de obter pelo menos 2 coroas;
     fprintf('a probabilidade de obter pelo menos 2 coroas = %4.4f\n',(1-(PXteorico(1)+PXteorico(2)+PXteorico(3))));

    %ii. a probabilidade de obter ate 1 coroa;
     fprintf('a probabilidade de obter ate 1 coroa = %4.4f\n',(1-PXteorico(4)));

    %iii. a probabilidade de obter entre 1 e 3 coroas.
     %fprintf('a probabilidade de obter entre 1 e 3 coroas = %4.4f\n',(1-PXteorico(4)));


