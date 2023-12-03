function x=sinal_x(t,A)
%
% sinal_x.m
% 
% Função para criar sinal periódico x(t) quadrado ou
% dente de serra. 
%
% Sintaxe:
%   x = sinal_x(t,A)
% Entradas:
%   t -> vetor de tempo
%   A -> largura da borda de subida
% Saídas:
%   x -> sinal periódico
%

x = mod(t,2*pi)/A.*(mod(t,2*pi)<A)+((mod(t,2*pi)>=A)&(mod(t,2*pi)<pi));