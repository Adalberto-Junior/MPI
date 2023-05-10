%Considere uma linguagem com apenas 3 palavras {“um”, “dois”, “tres” ˆ } e que permite sequencias de 2 ˆ
%palavras. Considere que todas as sequencias s ˆ ao equiprov ˜ aveis e que as duas palavras de uma sequ ´ encias ˆ
%podem ser iguais. As respostas as quest ` oes seguintes devem ser baseadas nos valores te ˜ oricos. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) Qual a probabilidade da sequencia “um dois”?
S = [ "um um" "um dois" "um tres" "dois um" "dois dois" "dois tres" "tres um" "tres dois" "tres tres"];
pUm_Dois = 1 / length(S);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(b) Qual a probabilidade de “um” aparecer pelo menos uma vez numa sequencia?
Ppelo_menos_um = 5 / length(S);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(c) Qual a probabilidade de ocorrer "um” ou “dois” numa sequencia?
pApenas_um_sem_dois = 2 / length(S);
pApenas_dois_sem_um = 2 / length(S);
pUm_ou_Dois = pApenas_um_sem_dois + pApenas_dois_sem_um;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(d) Qual o valor de P["sequencia incluir a palavra um” ˆ | “sequencia inclui palavra dois”]?
Ppelo_menos_um_dois = 5 / length(S);
pDois_Um = 1 / length(S);
pUm_inter_Dois = pUm_Dois + pDois_Um; 
PSequen_Um_ou_Dois = Ppelo_menos_um + Ppelo_menos_um_dois - pUm_inter_Dois;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Print():
fprintf("Print():\n");
fprintf("probabilidade da sequencia 'um dois' = %4.4f\n",pUm_Dois);
fprintf("probabilidade de 'um' aparecer pelo menos uma vez numa sequencia = %4.4f\n",Ppelo_menos_um);
fprintf("probabilidade de ocorrer 'um' ou 'dois' numa sequencia = %4.4f\n",pUm_ou_Dois);
fprintf("valor de P['sequencia incluir a palavra um'  | sequencia inclui palavra dois'] = %4.4f\n",PSequen_Um_ou_Dois);

