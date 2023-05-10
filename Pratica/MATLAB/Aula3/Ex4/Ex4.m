%4. Considere o seguinte diagrama representativo de uma Cadeia de Markov:


%(a) Defina, em Matlab, a matriz de transic¸ao de estados ˜ T assumindo p = 0, 4 e q = 0, 6.
p = 0.4;
q = 0.6;
T = [p^2      0  0 q^2
    (1-p)^2   0  0 q*(1-q)
     p*(1-p)  0  0 q*(1-q)
     p*(1-p)  1  1 (1-q)^2] 

%%
%(b) Assuma que o sistema se encontra inicialmente no estado A. Qual a probabilidade de estar em cada
%estado ao fim de 5 transic¸oes? E de 10 transic¸ ˜ oes? E de 100 transic¸ ˜ oes? E de 200 transic¸ ˜ oes?
% i)A para todos a fim de 5 transições:
    fprintf("\n De A para todos a fim de 5 transições:\n");
    T_5 = T^5;
   % PAA_5 = T_5(1) 
    %PBA_5 = T_5(2)
    %PCA_5 = T_5(3)
    %PDA_5 = T_5(4)
    PA_to_All5 = T_5(:,1) 

 % ii) A para todos a fim de 10 transições:
   fprintf("\n De A para todos a fim de 10 transições:\n");
    T_10 = T^10;
    %PAA_10 = T_10(1) 
    %PBA_10 = T_10(2)
    %PCA_10 = T_10(3)
    %PDA_10 = T_10(4)
    PA_to_All10 = T_10(:,1) 
  
% iii) A para todos a fim de 100 transições:
   fprintf("\n De A para todos a fim de 100 transições:\n");
    T_100 = T^100;
    %PAA_100 = T_100(1) 
    %PBA_100 = T_100(2)
    %PCA_100 = T_100(3)
    %PDA_100 = T_100(4)
    PA_to_All100 = T_100(:,1) 

% iiii) A para todos a fim de 200 transições:
   fprintf("\n De A para todos a fim de 200 transições:\n");
    T_200 = T^200;
    %PAA_200 = T_200(1) 
    %PBA_200 = T_200(2)
    %PCA_200 = T_200(3)
    %PDA_200 = T_200(4)
    PA_to_All200 = T_200(:,1) 

%(c) Determine as probabilidades limite de cada estado. Compare estes valores com os obtidos na al´ınea
%anterior. O que conclui?

%R-->A fim de 100 transições. Os valores de cada estado encontra-se em
%equilibrio. E todos os elementos nulos são substituidos por positivos não
%nulos.
% U * M = Z
I = eye(4);
M =[ T- I;
    ones(1,4)   %para a soma da probabilidade dar 1
    ];

b = [zeros(4,1);
            1];  %para a soma da probabilidade dar 1

u = M\b

