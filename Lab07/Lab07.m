%% Pratica Relatório no. 7
%
% Nome: Lucas de Souza Pelegrina
%
%% Etapa 1. TL de Sinais - a)
syms t
x = exp(-t);
X = laplace(x)
figure
subplot(1,2,1)
fplot(x,[0 5])
title('Sinal x(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on
subplot(1,2,2)
splane(1, [1 1])
title('Diagrama de polos e zeros')

%% Etapa 1. TL de Sinais - b)
y = exp(-t)*cos(10*t);
Y = laplace(y)
figure
subplot(1,2,1)
fplot(y, [0 5])
title('Sinal y(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on
subplot(1,2,2)
splane([1 1], [1 2 101])
title('Diagrama de polos e zeros')

%% Etapa 2. TL Inversa de Sinais - a)
clc; clear; close all
syms s;
X = (2*s+3)/(s^2+2*s+4);
x = ilaplace(X)
numX = [2 3];
denX = [1 2 4];
z = zeros(numX);
p = roots(denX);
[r,p] = residue(numX, denX)
figure
subplot(1,2,1)
fplot(x,[0 10])
axis([-0.1 10 -0.5 2.1])
title('Sinal x(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on 
subplot(1,2,2)
splane(numX,denX)
title('Diagrama de polos e zeros')

%% Etapa 2. TL Inversa de Sinais - b)
Y = (3*s^2+2*s-5)/(s^3+6*s^2+11*s+6);
y = ilaplace(Y)
numY = [3 2 -5];
denY = [1 6 11 6];
z = zeros(numY);
p = roots(denY);
[r,p] = residue(numY, denY)
figure
subplot(1,2,1)
fplot(y,[0 10])
axis([-0.1 10 -0.8 3.1])
title('Sinal y(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on 
subplot(1,2,2)
splane(numY,denY)
title('Diagrama de polos e zeros')

%% Etapa 3. Resolvendo EDO - a)
clc; clear; close all
syms s;
syms t;
num = 1;
den = [1 0.5 0.15];
H = 1/(s^2+0.5*s+0.15);
%printsys não funcionou... Professor pediu para printar normalmente
fprintf('A função de transferência é H(s)=')
pretty(H)
figure
splane(num, den)
title('Diagrama de polos e zeros')
%% Etapa 3. Resolvendo EDO - b)
h = ilaplace(H)
figure
fplot(h,[0 25])
title('Sinal h(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
%% Etapa 3. Resolvendo EDO - c)
X1 = 1/s
X2 = 2/(s+2)
Y1 = X1*H
Y2 = X2*H
y1 = ilaplace(Y1)
y2 = ilaplace(Y2)
x1 = ilaplace(X1);
x2 = ilaplace(X2);
figure
% Fiquei confuso com a pergunta então irei fazer tanto grafico para a
% saida, como entrada.
subplot(2,2,1)
fplot(x1,[0 25])
title('Sinal x1(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on
subplot(2,2,2)
fplot(x2,[0 25])
title('Sinal x2(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on
subplot(2,2,3)
fplot(y1,[0 25])
title('Saída y1(t)')
xlabel('tempo [s]')
ylabel('Amplitude')
hold on
subplot(2,2,4)
fplot(y2,[0 25])
title('Saída y2(t)')
xlabel('tempo [s]')
ylabel('Amplitude')








