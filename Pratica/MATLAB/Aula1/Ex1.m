%% exe1
N = 8
experiencias = rand(3,8)
lancamentos = experiencias > 0.5
resultados = sum(lancamentos)
sucessos = resultados == 2
aux = sum(sucessos)
probSimulacao = aux/8
