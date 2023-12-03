function y = rect(ti,tf,t)
%
% Função para criar um sinal retangular.
%
% Modo de uso:
%
%   y = rect(ti,tf,t)
%
% Entradas:
%
%   ti -> instante de tempo do início do retângulo
%   tf -> instante de tempo do final do retângulo
%   t  -> vetor de tempo
%
% Saídas:
%
%   y -> sinal retangular
%
% 27/set/2023
%

if nargin ~= 3
  error('Argumentos insuficientes.')
end

if ti < t(1)
   error('Instante inicial de tempo fora do vetor tempo.')
end

if tf > t(end)
   error('Instante final de tempo fora do vetor tempo.')
end

y=zeros(size(t));
ir=find(t>=ti & t<=tf);
y(ir)=1;
