%9. Considerando a variavel aleat ´ oria ´ X, representativa das classificac¸oes dos alunos de um determinado ˜
%curso, cont´ınua 3 e com distribuic¸ao normal 4 (media ´ 14 e desvio padrao˜ 2), obtenha atraves de simulac¸ ´ ao˜
%uma estimativa para as probabilidades de:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N = 1e5;
    turma = randn(1,N); 
    signal = 2;
    media = 14;
    x = (turma * signal) + media;
    histcounts(x);
    hist(x,N)
    mean(x); %confirmar a media
    std(x);  %confirmar o desvio
    %normcdf(18,14,2) - normcdf(10,14,12)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) um aluno do curso ter uma classificac¸ao entre ˜ 12 e 16
    CFav = (x > 12 & x < 16); %TANTO FAZ <= OU <
    p = sum(CFav)/N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(b) os alunos terem classificac¸oes entre 10 e 18
     CF = (x > 10 & x < 18); %TANTO FAZ <= OU <
     p = sum(CF)/N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(c) um aluno passar (ter classificac¸ao maior ou igual a 10)
     CFA = (x >= 10); %TANTO FAZ <= OU <
     p = sum(CFA)/N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(d) verifique a correc¸ao dos resultados anteriores usando a func¸ ˜ ao Matlab ˜ normcdf()
normcdf(18,14,2) - normcdf(10,14,12)
