%% Pratica Relatório no. 6
%
% Nome: Lucas de Souza Pelegrina
%
%% Etapa 1. Obtencao da solucao algebrica - A)
clear all; clc; close all

syms y(t)
Dy = diff(y);
cond1= y(0)==0;
cond2= Dy(0)==1;
conds=[cond1 cond2];
ode = diff(y,t,2)+3*diff(y,t)+2*y==4;
ySol(t) = dsolve(ode,conds);

t = 0:0.1:10;
eo = eval(ySol);

figure
plot(t,eo)
title('Resposta de Saída')
xlabel('tempo [s]')
ylabel('Saída [v]')
legend('V=2 e R=3')
grid
%% Etapa 1. Obtencao da solucao algebrica - B)

syms y(t)
ode = diff(y,t,2)+3*diff(y,t)+2*y==1;
ySol(t) = dsolve(ode,conds);

hold on
t = 0:0.1:10;
eo = eval(ySol);

plot(t,eo,'r')
legend('V=2 e R=3','V=0,5 e R=3')
grid

%% Etapa 1. Obtencao da solucao algebrica - C)

syms y(t)
ode = diff(y,t,2)+2*diff(y,t)+2*y==1;
ySol(t) = dsolve(ode,conds);

hold on
t = 0:0.1:10;
eo = eval(ySol);

plot(t,eo,'k')
legend('V=2 e R=3','V=0,5 e R=3','V=0,5 e R=2')
grid

%% Etapa 2. Obtencao da solucao numerica - A)
clear all; clc; close all

tspan = [0 10];
conds = [0; 0];

R = [1, 3, 5];
L = 1;
C = 1/2;


figure;
for i = 1:3
    [t,y] = ode45(@(t,y)derivadas(t,y,R(i),L,C,1),tspan,conds);
    plot(t,y(:,1))
    hold on
end
title('Resposta de Saída do Sistema')
xlabel('tempo [s]')
ylabel('Saída [v]')
legend('R=1','R=3','R=5')
grid
%% Etapa 2. Obtencao da solucao numerica - B)
figure
for i = 1:3
    [t,y] = ode45(@(t,y)derivadas(t,y,R(i),L,C,exp(-2*t)),tspan,conds);
    plot(t,y(:,1))
    hold on
end
title('Resposta de Saída do Sistema')
xlabel('tempo [s]')
ylabel('Saída [v]')
legend('R=1','R=3','R=5')
grid
%% Etapa 2. Obtencao da solucao numerica - C)
figure
for i = 1:3
    [t,y] = ode45(@(t,y)derivadas(t,y,R(i),L,C,exp(-1/2*t)*cos(10*t)),tspan,conds);
    plot(t,y(:,1))
    hold on
end
title('Resposta de Saída do Sistema')
xlabel('tempo [s]')
ylabel('Saída [v]')
legend('R=1','R=3','R=5')
grid