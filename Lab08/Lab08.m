%% Pratica Relatório no. 8
%
% Nome: Lucas de Souza Pelegrina
%
%% Etapa Inicial...
syms t
x = heaviside(t);
X_t = fourier(x);
fplot(abs(X_t));
xlabel('Frequencia [Omega]')
ylabel('Amplitude')

%% Etapa 1. TF de Sinais - a)
clc; clear all; close all
syms t
a = [2 3 5];
figure
for i = 1:length(a)
    x = exp(-a(i)*t)*heaviside(t);
    X_t = fourier(x);
    fplot(x,[-1 3])
    title('Gráfico x(t)')
    xlabel('Tempo [s]')
    ylabel('Amplitude')
    legend('a = 2', 'a = 3', 'a = 5')
    hold on
end

figure

for i = 1:length(a)
    x = exp(-a(i)*t)*heaviside(t);
    X_t = fourier(x);
    subplot(1,2,1)
    fplot(abs(X_t),[-20 20])
    title('Espectro de X(jw)')
    xlabel('Frequencia [Hz]')
    ylabel('Amplitude')
    legend('a = 2', 'a = 3', 'a = 5')
    hold on
    subplot(1,2,2)
    fplot(angle(X_t), [-20 20])
    title('Fase de X(jw)')
    xlabel('Frequencia [Hz]')
    ylabel('Fase [rad]')
    legend('a = 2', 'a = 3', 'a = 5')
    hold on
end


%% Etapa 1. TF de Sinais - b)
x1 = rectangularPulse(t/2);
x2 = sin(t)/(pi*t);
X1_t = fourier(x1);
X2_t = fourier(x2);

figure
subplot(2,2,1)
fplot(x1)
title('rect(t/2)')
xlabel('Tempo [s]')
ylabel('Amplitude')
subplot(2,2,2)
fplot(x2, [-20 20])
title('2sinc(Omega)')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')
subplot(2,2,3)
fplot(X1_t, [-20 20])
title('(1/pi)sinc(t)')
xlabel('Tempo [s]')
ylabel('Amplitude')
subplot(2,2,4)
fplot(X2_t)
title('rect(Omega/2)')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')

%% Etapa 2. Propriedades da TF - a)
clc; clear all; close all
syms t
x1 = rectangularPulse(t);
x2 = rectangularPulse(2*t);
X1_t = fourier(x1);
X2_t = fourier(x2);
figure
fplot(abs(X1_t),[-20 20])
hold on
fplot(abs(X2_t),[-20 20])
title('Espectro de X(Omega)')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')
legend('X1 = tf(rect(t))','X2 = tf(rect(2t))')

%% Etapa 2. Propriedades da TF - b)
x1 = exp(-3*t)*heaviside(t);
x2 = exp(-3*(t-2))*heaviside(t-2);
X1_t = fourier(x1);
X2_t = fourier(x2);
figure
subplot(1,2,1)
fplot(abs(X1_t),[-20 20])
hold on
fplot(abs(X2_t),[-20 20])
title('Espectro de X(Omega)')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')
legend('X1 = tf(exp(-3t)*u(t)','X2 = tf(exp(t-2)*u(t-2)')
subplot(1,2,2)
fplot(angle(X1_t),[-20 20])
hold on
fplot(angle(X2_t),[-20 20])
title('Fase de X(jw)')
xlabel('Frequencia [Hz]')
ylabel('Fase [rad]')

%% Etapa 2. Propriedades da TF - c)
x = triangularPulse(t/4)*cos(10*t);
X_t = fourier(x);
figure
subplot(1,2,1)
fplot(x,[-5 5])
title('Gráfico de x(t)')
xlabel('Tempo [s]')
ylabel('Amplitude')
subplot(1,2,2)
fplot(abs(X_t),[-20 20])
title('Espectro de X(Omega)')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')
%% Etapa 3. Filtros com TF - a)
clc; clear all; close all
t = 0:0.04:40;
fs = 25;
x = cos(2*pi*t)+cos(2*pi*5*t);
[X,f] = fftm(x,fs); %Inverso do periodo
plot(f,abs(X))
title('Espectro de X(Omega)')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')
%% Etapa 3. Filtros com TF - b)
H_num = 1;
H_den = [1 -0.9];
H = freqs(H_num,H_den,f);
Y = X.*H;
figure
plot(f,abs(Y))
title('Espectro da Saída de YH')
xlabel('Frequencia [Hz]')
ylabel('Amplitude')


















