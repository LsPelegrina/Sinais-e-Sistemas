%% Pratica Relatório no. 5
%
% Nome: Lucas de Souza Pelegrina
%
%% Etapa 1. Solucao Homogenea - A)
clear all; clc; close all

C = 1/2;
R = 3;
L = 1;

p = roots([1 R/L 1/(L*C)])

c1 = p(2)/(p(2)-p(1))
c2 = p(1)/(p(1)-p(2))

fprintf('\nAs raízes do polinômio são %g e %g.\n\n',p(1),p(2))
fprintf('\nAs constantes c1 e c2 são, respectivamente, %g e %g.\n\n',c1,c2)

t = 0:0.01:10;

e = c1*exp(p(1)*t)+c2*exp(p(2)*t);
plot(t,e)
title('Tensão de saída da solução homogênea')
xlabel('Tempo[s]')
ylabel('Tensão de Saída')
legend('R=1')
%% Etapa 1. Solucao Homogenea - B)

R2 = 1:1:5;
figure 
for i = 1:length(R2)
    p = roots([1 R2(i)/L 1/(L*C)]);
    c1 = p(2)/(p(2)-p(1));
    c2 = p(1)/(p(1)-p(2));
    eo = c1*exp(p(1)*t)+c2*exp(p(2)*t);
    plot(t,eo)
    hold on
end
title('Tensão de saída da solução homogênea')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('R2=1','R2=2','R2=3','R2=4','R2=5')
grid
%% Etapa 2. Resposta completa - A)
clear all; clc; close all

C = 1/2;
R = 1:1:5;
L = 1;
V = 2;
c3 = V;
t = 0:0.01:10;

figure
for i = 1:length(R)
    p = roots([1 R(i)/L 1/(L*C)]);
    c1 = ((1-V)*p(2))/(p(2)-p(1));
    c2 = ((1-V)*p(1))/(p(1)-p(2));
    e = c1*exp(p(1)*t)+c2*exp(p(2)*t)+c3;
    plot(t,e)
    hold on
end

title('Resposta Completa')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('R=1','R=2','R=3','R=4','R=5')
grid
%% Etapa 2. Resposta completa - B)

R2 = [1 3 5];
w = 10;

figure
for i = 1:length(R2)
    p2 = roots([1 R2(i)/L 1/(L*C)]);

    a = (1/(L*C))-w^2;
    b = (R2(i)/L)*w;

    c6 = a/(a^2+b^2);
    c7 = b/(a^2+b^2);

    c4 = (c7*w-c6*p2(2))/(p2(2)-p2(1));
    c5 = (c6*p2(1)-c7*w)/(p2(2)-p2(1));

    eo = c4*exp(p2(1)*t)+c5*exp(p2(2)*t)+c6*cos(w*t)+c7*sin(w*t);
    plot(t,eo)
    hold on
end

title('Resposta Completa')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('R2=1','R2=3','R2=5')
grid
