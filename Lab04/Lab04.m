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

t = 0:0.01:10;

e = c1*exp(p(1)*t)+c2*exp(p(2)*t);
plot(t,e)

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

%% Etapa 2. Resposta completa - A)
clear all; clc; close all

T = 0:1/32:4;
T2 = 0:1/32:8;

h = 0.1*exp(-5.*T);

x = 0.1.*g;

y = conv(h,x);

figure
subplot(3,1,1)
plot(T,x)
title('x(T)','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid

subplot(3,1,2)
plot(T,h)
title('h(T)','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid

subplot(3,1,3)
plot(T2,y)
title('y(T)','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid


%% Etapa 2. Resposta completa - B)

X = 10.*g.*sin(16.*T);

Y = conv(X,h);

figure
subplot(3,1,1)
plot(T,X)
title('X(T)','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid

subplot(3,1,2)
plot(T,h)
title('h(T)','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid

subplot(3,1,3)
plot(T2,Y)
title('Y(T)','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid
