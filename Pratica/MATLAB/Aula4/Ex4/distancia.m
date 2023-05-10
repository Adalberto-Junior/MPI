function[J] = distancia(Nu,Set)

J=zeros(Nu,Nu); % array para guardar distaˆncias
h= waitbar(0,'Calculating');
for n1= 1:Nu
    waitbar(n1/Nu,h);

for n2= n1+1:Nu
    %% Adicionar co´digo aqui
      u1 = Set{n1,:};
      u2 = Set{n2,:};
    intcer = length(intersect(u1,u2));
    uniao = length(union(u1,u2));
    dj = 1 - (intcer / uniao);
    J(n1) = dj;
end

end
delete (h)