%Problema 1:

T = [0.4 0.7/3 1/4 1/4
    0.2  0.3  1/4  1/4
    0.2  0.7/3 1/4 1/4
    0.2  0.7/3 1/4 1/4]



QuintaSe = (T^4)
urb = QuintaSe(:,4)

for i = 2:5
    Ambients = T^i

end

%Problema 2:

L = load("L.mat")
H = L.L /110 %Matriz de Transição
beta = 0.85
A = beta * H + 1- beta

%3

T = []
