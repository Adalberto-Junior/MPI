%Considere que o tempo em cada dia e genericamente classificado num de 3 estados – sol, nuvens e chuva ´
%– e que o tempo num determinado dia apenas depende do tempo no dia anterior. Assuma que estamos
%no primeiro dia de janeiro e que as probabilidades de transic¸ao de estados s ˜ ao as da tabela seguinte. ˜
%dia n \ dia n + 1 →| sol nuvens chuva |
%sol                |   0,7 |0,2 |  0,1|
%nuvens             |   0,2 |0,3 |  0,5|
%chuva              |   0,3 |0,3 |  0,4|
%----------------------------------------
%%
%(a) Defina, em Matlab, a correspondente matriz de transic¸ao.

T = [0.7  0.2  0.3
     0.2  0.3  0.3
     0.1  0.5  0.4]


%%
%(b) Qual a probabilidade de estar sol no segundo dia e no terceiro dia de janeiro quando o primeiro dia
%e de sol?
Tempo_Prim = [1;0;0];
%Tempo_no_2 = T * Tempo_Prim;
%Tempo_no_3 = T^2 * Tempo_Prim;  
%empo_no_2 = T(1,1) 
Tempo_no_3 = T^2;
Sol_no_2 = T(1,1);
Sol_no_3 = Tempo_no_3(1,1);
fprintf(" P de estar sol no segundo dia, quando o primeiro é sol = %.4f\n",Sol_no_2);
fprintf(" P de estar sol no terceiro dia, quando o primeiro é sol = %.4f\n",Sol_no_3);
%%
%(c) Qual a probabilidade de nao chover nem no segundo dia nem no terceiro dia de janeiro quando o ˜
%primeiro dia e de sol?
Nao_chuva_no_2 = 1 - T(3,1);
Nao_chuva_no_3 = 1 - Tempo_no_3(3,1);
fprintf(" P de não chover no segundo dia, quando o primeiro é sol = %.4f\n",Nao_chuva_no_2);
fprintf(" P de não chover no terceiro dia, quando o primeiro é sol = %.4f\n",Nao_chuva_no_3);
%Nem_dois = Nao_chuva_no_2 & Nao_chuva_no_3 
%%
%Assumindo que o primeiro dia é de sol, determine o número médio de dias de sol, de nuvens e de ´
%chuva que se espera ter em todo o mes de janeiro. 
%T_janeiro_all = T^30
respSol = 1;
respchuv = 0;
respNuv = 0;
v=[1;0;0];
for i = 2:31
    vx = T * v;
    respSol = respSol + vx(1);
    respchuv = respchuv + vx(2);
    respNuv = respNuv + vx(3);
    v = vx;

end
fprintf("Número medio de Tempo que se espera ter em todo o mês de Janeiro, sabendo que o primeiro dia é Sol:\n")
fprintf("Sol   = %d\n" , int16(respSol));
fprintf("Chuva = %d\n" , int16(respchuv))
fprintf("Nuvem = %d\n" , int16(respNuv));
%DiasMedio = T_janeiro_all * 30
%Dias_Medio_Sol_nuv_chu_1Sol = int16(DiasMedio(:,1))

%(e) Assumindo que o primeiro dia e de chuva, determine o n ´ umero m ´ edio de dias de sol, de nuvens e ´
%de chuva que se espera ter em todo o mes de janeiro. Compare estes resultados com os da al ˆ ´ınea
%anterior. O que conclui?
%Primeiro dia:
respsol = 0;
respChuv = 1;
respnuv = 0;
v=[0;0;1];
for i = 2:31
    v = T * v;
    respsol = respsol + v(1);
    respChuv = respChuv + v(2);
    respnuv = respnuv + v(3);
    %v = vx;
end
fprintf("Número medio de Tempo que se espera ter em todo o mês de Janeiro, sabendo que o primeiro dia é Chuva:\n")
fprintf("Sol   = %d\n" , int16(respsol));
fprintf("Chuva = %d\n" , int16(respChuv))
fprintf("Nuvem = %d\n" , int16(respnuv));

%Resposta: Concluir que o valor muda se o primeiro dia mudar. 

%Di_Me_S_n_ch_1Chv = int16(DiasMedio(:,2))
%Resposta : os dias medios no mes de janeiro, são iguais ou seja a 
%%
%(f) Considere uma pessoa com reumatismo cronico que tem dores reum ´ aticas com probabilidades de ´
%10%, 30% e 50% quando os dias sao de sol, de nuvens ou de chuva, respetivamente. Qual o n ˜ umero ´
%esperado de dias que a pessoa vai sofrer de dores reumaticas em janeiro quando o primeiro dia ´ e de ´
%sol? E quando o primeiro dia e de chuva? 
PrematSol = 10/100;
PrematNuvem = 30 / 100;
PrematChuva = 50 / 100;
diaComRs =   PrematSol * respSol;
diaComRn =   PrematNuvem * respNuv;
diaComRch =   PrematChuva * respchuv;
di_Med_cm_rem_J_1s = diaComRs + diaComRn + diaComRch;
fprintf("Segundo as P, os D meidos que ela vai sofre em janeiro dado que o primeiro dia é sol:\n");
fprintf("É de %d dias;\n",int16(di_Med_cm_rem_J_1s));
%%
% E quando o primeiro dia e de chuva? 
diaComRs1c =   PrematSol * respsol;
diaComRn1c =   PrematNuvem * respnuv;
diaComRch1c =   PrematChuva * respChuv;
di_Med_cm_rem_J_1c = diaComRs1c + diaComRn1c + diaComRch1c;
fprintf("Segundo as P, os D meidos que ela vai sofre em janeiro dado que o primeiro dia é Chuva:\n");
fprintf("É de %d dias;\n",int16(di_Med_cm_rem_J_1c));
