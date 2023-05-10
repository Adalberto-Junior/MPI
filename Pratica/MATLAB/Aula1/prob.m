function [probSilumacao] = prob(p,n,k,N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
probSilumacao = sum(sucessos)/N
end