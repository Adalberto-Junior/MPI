% a state transition matrix example
H = [0.5 0.5 0;
     0.5 0.4 0;
     0   0.1 1];
% how to use crawl()
state = crawl(H, 1, 2)

T = [0.8  0  0.3 0 0
     0.2 0.6 0.2 0 0
      0  0.1 0.4 0 0
      0  0.3  0  1 0
      0   0  0.1 0 1];


state1 = crawl(T,1,[4 5])

%Dados: 1 1 2 4 
X = [T(1:1) T(2) T(2) T(4:4,2)] 

%Duvida!

