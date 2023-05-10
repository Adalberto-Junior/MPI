%Considere que uma empresa tem 3 programadores (Andre, Bruno e Carlos) e que a probabilidade de um ´
%programa de cada um deles ter problemas ("bugs”) e o numero de programas desenvolvidos assumem os ´
%valores apresentados na tabela seguinte.
%Programador| Prob("erro num programa")| programas
%André      |   0.01                   |  20
%Bruno      |   0.05                   |  30
%Carlos     |   0.001                  |  50
N = 1e5;
progA= rand(20, N) < 0.01;
progB = rand(30,N) < 0.05;
progC = rand(50,N) < 0.001;
prog = [progA; progB;progC;];
CA = sum(sum(prog));
%CB = sum(progA)/N;
EC = sum(sum(progC));
probC = EC / CA