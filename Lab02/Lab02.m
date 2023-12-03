%%  Pratica no. 02
%
%  Aluno: Lucas de Souza Pelegrina
%         

%% 1a -> Etapa 1. Multiplicação com Degrau
clc; clear; close all
t = -0.5:0.025:5;
x = zeros(size(t));
for i = 1:length(x)
    if t(i) < 1
        x(i) = 0;
    elseif t(i) >= 1 && t(i) < 2
        x(i) = t(i)-1;
    elseif t(i) >= 2 && t(i) < 4
        x(i) = 1;
    end
end

plot(t,x)
xlim([0.5 5])
ylim([-1 1.5])
xlabel('Tempo[s]')
ylabel('Amplitude')
title('Gráfico')
grid


%% 1b
F1 = t.^2;
F2 = 2*(t-4);
rectF1 = rectangularPulse(0,2,t);
rectF2 = rectangularPulse(2,4,t);
figure
subplot(3,1,1)
plot(t,(F1.*rectF1))
title('Gráfico 1')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('F1(t)')
ylim([-1 5])
subplot(3,1,2)
plot(t,(F2.*rectF2))
title('Gráfico 2')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('F2(t)')
ylim([-5 1])
subplot(3,1,3)
plot(t,(F1.*rectF1+F2.*rectF2))
title('Gráfico 3')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('F1(t)+F2(t)')

%% 2a -> Etapa 2. Funções Pares e Ímpares
clc; clear; close all
t = -3:0.025:3;
a = 2;
u = zeros(size(t));
for i = 1:length(u)
 if(t(i)>0)
 u(i) = 1;
 end
end

k = ones(size(t));
for i = 1:length(k)
 if(t(i)>0)
 k(i) = 0;
 end
end

subplot(2,1,1)
plot(t,(exp(-a.*t).*u))
title('Gráfico 1')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X(t)')
subplot(2,1,2)
plot(t,(exp(-a.*-t).*k))
title('Gráfico 2')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X(-t)')

%% 2b
X = exp(-a.*t);
X_e = (1/2)*((exp(-a.*t).*u)+(exp(-a.*-t).*k));
X_0 = (1/2)*((exp(-a.*t).*u)-(exp(-a.*-t).*k));
figure
subplot(3,1,1)
plot(t,X_e)
title('Gráfico 1')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X_e(t)')
ylim([-0.5 1])
subplot(3,1,2)
plot(t,X_0)
title('Gráfico 2')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X_0(t)')
ylim([-0.5 1])
subplot(3,1,3)
plot(t,(X_e+X_0))
title('Gráfico 3')
xlabel('Tempo[s]')
ylabel('Amplitude')
legend('X_e(t)+X_0(t)')
ylim([-0.5 1])





