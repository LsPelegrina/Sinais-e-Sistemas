%% Pratica Relatório no. 3
%
% Nome: Lucas de Souza Pelegrina
%
%% Etapa 1. Série de Taylor - A)
%Criando a váriavel tempo que vai de -pi até pi em intervalos de 0,01
%segundos.

t = -pi:0.01:pi;

%Criando váriaveis que correspodem aos 4 termos da série de taylor, como
%centrada em 0, logo, série de Maclaurin.

f_1 = t;
f_2 = -t.^3/factorial(3);
f_3 = t.^5/factorial(5);
f_4 = -t.^7/factorial(7);

%Organizando agora com o comando subplot para separar os gráficos em
%partes.
%Primeiro gráfico
subplot(2,2,1)
plot(t,f_1)
title('f(t)=t','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-3.5 3.5 -1.5 1.5])
grid

%Segundo gráfico
subplot(2,2,2)
plot(t,f_1+f_2)
title('f(t)=t-$\frac{t^3}{3!}$','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-3.5 3.5 -1.5 1.5])
grid

%Terceiro gráfico
subplot(2,2,3)
plot(t,f_1+f_2+f_3)
title('f(t)=t-$\frac{t^3}{3!}$+$\frac{t^5}{5!}$','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-3.5 3.5 -1.5 1.5])
grid

%Quarto gráfico
subplot(2,2,4)
plot(t,f_1+f_2+f_3+f_4)
title('f(t)=t-$\frac{t^3}{3!}$+$\frac{t^5}{5!}$-$\frac{t^7}{7!}$','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-3.5 3.5 -1.5 1.5])
grid

%% Etapa 1. Série de Taylor - B)
clc; clear; close all

%Criando a váriavel tempo que vai de -pi/2 até 3pi/2 em intervalos de 0,01
%segundos.

t = -pi/2:0.01:3*pi/2;

%Criando váriaveis que correspodem aos 4 termos da série de taylor,
%centrada em a = pi/2, utilizando a ferramenta taylortool para gerar os devidos coefientes.

f_1 = 1;
f_2 = -(t-pi/2).^2/factorial(2);
f_3 = (t-pi/2).^4/factorial(4);
f_4 = -(t-pi/2).^6/factorial(6);

%Organizando agora com o comando subplot para separar os gráficos em
%partes.
%Primeiro gráfico
subplot(2,2,1)
plot(t,f_1)
title('f(t)=1','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-1.62 4.75 -1.5 1.5])
grid

%Segundo gráfico
subplot(2,2,2)
plot(t,f_1+f_2)
title('f(t)=1-$\frac{(t-\frac{\pi}{2})^2}{2!}$','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-1.62 4.75 -1.5 1.5])
grid

%Terceiro gráfico
subplot(2,2,3)
plot(t,f_1+f_2+f_3)
title('f(t)=1-$\frac{(t-\frac{\pi}{2})^2}{2!}$+$\frac{(t-\frac{\pi}{2})^4}{4!}$','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-1.62 4.75 -1.5 1.5])
grid

%Quarto gráfico
subplot(2,2,4)
plot(t,f_1+f_2+f_3+f_4)
title('f(t)=1-$\frac{(t-\frac{\pi}{2})^2}{2!}$+$\frac{(t-\frac{\pi}{2})^4}{4!}$-$\frac{(t-\frac{\pi}{2})^6}{6!}$','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-1.62 4.75 -1.5 1.5])
grid

%% Etapa 2. Série de Fourier - A)
clc; clear; close all

%Criando a váriavel tempo que vai de -1 até 9 em intervalos de 0,01
%segundos.

t = -1:0.01:9;

%Chamando a função sinal x.m e criando a váriavel A, cujo valor é pi/2.

A = pi/2;

x = sinal_x(t, A);

%Apresentando o sinal no gráfico no tempo t.

plot(t,x)
title('f(t)=x','Interpreter','latex')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
axis([-1.5 9.5 -0.25 1.25])
grid

%Chamando a função fourierS.m e criando a váriavel k, cujo valor é 20, e
%seu modulo é N;

k = 20;

N = abs(k);

[x_N, ~] = fourierS(t,A,N);

%Criando um novo gráfico para que seja aberto uma primeira figura, e depois
%outra com a sobreposição.

figure
plot(t,x)
title('Aproximaçao de x(t) em relaçao ao grafico anterior')
xlabel('Tempo[s]')
ylabel('Amplitude[cm]')
grid
hold on
plot(t,x_N)

%Chamando a função max para calcular o overshoot

sobressinal = max(x_N)-1;
fprintf('\nO sobressinal é %g.\n\n',sobressinal)

%% Etapa 2. Série de Fourier - B)
clc; clear; close all

t = -1:0.01:9;
A = pi/2;

%Chamando a função fourierS.m para obter uma nova aproximação usando k máximo de 100

k = 100;

N = abs(k);

[x_N, c] = fourierS(t,A,N);

%Criando uma váriavel para armazenar o módulo do espectro de Fourier dos
%coeficientes C_k
ModCoef = abs(c);
%Plotando no gráfico o módulo do espectro de Fourier dos coeficientes C_k

plot(ModCoef)
title('Modulo do espectro de fourier dos coeficientes C_k')
xlabel('K[\omega_0]')
ylabel('C_k')
grid
axis([0 200 0 0.4])


