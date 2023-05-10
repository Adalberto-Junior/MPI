%2. Considere a seguinte "danc¸a” de grupos: Divide-se uma turma em 3 grupos (A, B e C) no in´ıcio do
%semestre e no final de cada aula efectuam-se os seguintes movimentos:
%• 1/3 do grupo A vai para o grupo B e outro 1/3 do grupo A vai para o grupo C;
%• 1/4 do grupo B vai para A e 1/5 de B vai para C
%• Metade do grupo C vai para o grupo B; a outra mantem-se no grupo C.



%%Estócastica
%sum(T) == 1;
%Todos T >= 0 e T <= 1;

T = [1/3 1/4 0
     1/3 11/20 1/2
     1/3 1/5   1/2]
%%
%(a) Crie em Matlab a matriz de transic¸ao de estados que representa as trocas entre grupos. ˜
%Confirme que se trata de uma matriz estocastica.
x = sum(T);  % é Estócastica:
%sum(T) == 1;
%Todos T >= 0 e T <= 1;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(b) Crie o vector relativo ao estado inicial considerando que no total temos 90 alunos, o grupo A tem
%o dobro da soma dos outros dois e os grupos B e C tem o mesmo n ˆ umero de alunos.
% Alunos = 90
% A = 2(B+C)
% B = C
% A + B + C = 90 <=> 2B + 2C + B + C = 90 <=>  2B + 2B + B + B = 90 
% <=> 6B = 90 <=> B = 90 / 6 <=> B = 15, A = 60, C = 15;
format rational  
v0 = [60 15 15]'/90
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(c) Quantos elementos integrarao cada grupo no fim da aula 30 considerando como estado inicial o ˜
%definido na al´ınea anterior?
v30 = T^30 * v0;
format bank
nA = v30 * 90;
fprintf("No fim da aula 30, %.0f elementos integrarão em A, %.0f em B e %.0f em C",nA(1), nA(2),nA(3));
%%
%(d) Quantos elementos integrarao cada grupo no fim da aula 30 considerando que inicialmente se dis- ˜
%tribuiram os 90 alunos equitativamente pelos 3 grupos?
format rational
newV0 = [30 30 30]' / 90
newV30 = T^30 * newV0;
format bank
nAluno = newV30 * 90;
fprintf("\nNo fim da aula 30, %.0f elementos integrarão em A, %.0f em B e %.0f em C\n",nAluno(1), nAluno(2),nAluno(3));

