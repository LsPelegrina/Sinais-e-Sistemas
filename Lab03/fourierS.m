function [x_N, c] = fourierS(t,A,N)
% 
% fourierS.m
%
% Função para aproximar x(t) usando série de Fourier 
% truncada em |k| = N
%
% Sintaxe:
%   [x_N, c] = fourierS(t,A,N)
% Entradas:
%   t -> vetor tempo  
%   A -> largura da borda de subida
%   N -> maior componente da série de Fourier
% Saídas:
%   x_N -> aproximação da série de Fourier com N componentes
%   c -> coeficientes complexos da série de Fourier
%
% Lathi & Green (2018)

D = @(n) 1/(2*pi*n)*((exp(-1j*n*A)-1)/(n*A) + 1j*exp(-1j*n*pi));
% Construct truncated FS approximation of x(t) using N harmonics
x_N = (2*pi-A)/(4*pi)*ones(size(t)); % Compute dc term
c = zeros(2*N+1,1);
c(N+1)=(2*pi-A)/(4*pi);
for n = 1:N % Compute N remaining terms
    c(N+1+n) = D(n);
    c(N+1-n) = conj(D(n));
    x_N = x_N+real(D(n)*exp(1j*n*t) + conj(D(n))*exp(-1j*n*t));
end