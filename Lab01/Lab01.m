%%  Pratica no. 01
%
%  Aluno: Lucas de Souza Pelegrina
%         

%% Etapa 1.a Deslocamento e Escalonamento de Sinais
clc; clear; close all
t = -0.5:0.01:1.5;
x = (1/2)*cos(2*pi*t);
plot(t,x)
title('Gráfico')
xlabel('Tempo[s]')
ylabel('Amplitude')
%% 1.b
y = (1/2)*cos(2*pi*(t-pi/2));
z = (1/2)*cos(2*pi*(t+pi/2));
hold on
plot(t,y)
plot(t,z)
legend('x(t)','y(t)','z(t)')
%% 1.c
y = (1/2)*cos(2*pi*(2*t));
z = (1/2)*cos(2*pi*(t/2));
figure
subplot(311)
plot(t,x)
title('Gráfico 1')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X(t)')
subplot(312)
plot(t,y)
title('Gráfico 2')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('Y(t)')
subplot(313)
plot(t,z)
title('Gráfico 3')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('Z(t)')
%% Etapa 2.a Senoides Amortecidas
clc; clear; close all
t = 0:0.01:2;
x = 4*exp(-2*t).*cos(6*t-pi/3);
y = 4*exp(-2*t);
z = -4*exp(-2*t);
plot(t,x,'r')
hold on
plot(t,y,'k--')
plot(t,z,'k--')
title('Gráfico')
xlabel('Tempo[s]')
ylabel('Amplitude')
%% 2.b
figure
y = 4*exp(-4*t).*cos(6*t-pi/3);
z = 4*exp(-t/2).*cos(6*t-pi/3);
w = 4*exp(t/2).*cos(6*t-pi/3);
hold on
plot(t,x)
plot(t,y)
plot(t,z)
plot(t,w)
title('Gráfico')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X(t)','Y(t)','Z(t)','W(t)')
%% 2.c
figure
u = zeros(size(x));
for i = 1:length(x)
    if(t(i)>=1/2 && t(i) <= 3/2)
        u(i) = 1;
    end
end
k = (4*exp(-2*t).*cos(6*t-pi/3)).*u;
hold on
title('Gráfico')
xlabel('Tempo[s]')
ylabel('Amplitude')
plot(t,x,'k--')
plot(t,k,'r')
legend('X(t)','K(t)')
