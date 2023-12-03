%% Pratica Relatório no. 9
%
% Nome: Lucas de Souza Pelegrina
%
%% Etapa 1. Diagrama de Bode e Filtros - A)
clc; clear all; close all
W_n = 500; % rad/s
Zeta = 0.7; % Taxa de amortecimento
H_lpf_Num = W_n^2;
H_lpf_Den = [1 2*Zeta*W_n W_n^2];
sys_lpf = tf(H_lpf_Num, H_lpf_Den) %G(s)
bode(sys_lpf)
grid
%% Etapa 1. Diagrama de Bode e Filtros - B)
H_hpf_Num = [1 0 0];
H_hpf_Den = [1 2*Zeta*W_n W_n^2];
sys_hpf = tf(H_hpf_Num, H_hpf_Den) %G(s)
bode(sys_hpf)
grid
%% Etapa 1. Diagrama de Bode e Filtros - C)
H_bpf_Num = [2*Zeta*W_n 0];
H_bpf_Den = [1 2*Zeta*W_n W_n^2];
sys_bpf = tf(H_bpf_Num, H_bpf_Den)
bode(sys_bpf)
grid
%% Etapa 2. TF e Filtros - A)
clc; clear all; close all
syms t w;
W_n = 500; % rad/s
Zeta = 0.7; % Taxa de amortecimento
x = cos(100*t)+cos(500*t)+cos(1000*t);
X = fourier(x)
H_lpf_jw = (W_n^2)/(-w^2 + 2*Zeta*W_n*w*1i + W_n^2)
Y= H_lpf_jw*X
y= ifourier(Y,t)
t = 0:0.002:1;
x_numeric = eval(x);
y_numeric = eval(y);
figure
plot(t,x_numeric)
title('Entrada x(t)')
xlabel('Tempo [s]')
ylabel('Amplitude')
figure
plot(t,y_numeric)
title('Saída yLPF(t)')
xlabel('Tempo [s]')
ylabel('Amplitude')
fs=500; %Inverso do periodo
[X2,f] = fftm(x_numeric,fs);
figure
plot(f*2*pi,abs(X2)) %multiplicado por 2pi para dar a resposta em rad/s
title('Espectro da Entrada [X(jw)]')
xlabel('Frequencia Angular [rad/s]')
ylabel('Amplitude')
[Y2,f] = fftm(y_numeric,fs);
figure
plot(f*2*pi,abs(Y2))
title('Espectro da SaídaLPF [Y(jw)]')
xlabel('Frequencia Angular [rad/s]')
ylabel('Amplitude')


%% Etapa 2. TF e Filtros - B)
syms t w;
H_hpf_jw = (-w^2)/(-w^2 + 2*Zeta*W_n*w*1i + W_n^2)
Y_hpf = H_hpf_jw*X
y_hpf = ifourier(Y_hpf,t)
t = 0:0.002:1;
y_hpf_numeric = eval(y_hpf);
figure
plot(t,x_numeric)
title('Entrada x(t)')
xlabel('Tempo [s]')
ylabel('Amplitude')
figure
plot(t,y_hpf_numeric)
title('Saída yHPF(t)')
xlabel('Tempo [s]')
ylabel('Amplitude')
fs=500; %Inverso do periodo
[Y2_hpf,f] = fftm(y_hpf_numeric,fs);
figure
plot(f*2*pi,abs(X2)) %multiplicado por 2pi para dar a resposta em rad/s
title('Espectro da Entrada [X(jw)]')
xlabel('Frequencia Angular [rad/s]')
ylabel('Amplitude')
figure
plot(f*2*pi,abs(Y2_hpf))
title('Espectro da SaídaHPF [Y(jw)]')
xlabel('Frequencia Angular [rad/s]')
ylabel('Amplitude')
%% Etapa 3. TF e Filtros
zeta3 = [0.05 0.3 0.9];
fs=500; %Inverso do periodo
for i =1:length(zeta3)
    syms t w;
    H_bpf_jw = (2*zeta3(i)*W_n*w*1i)/(-w^2 + 2*zeta3(i)*W_n*w*1i + W_n^2)
    Y_bpf = H_bpf_jw*X
    y_bpf = ifourier(Y_bpf,t)
    t = 0:0.002:1;
    y_bpf_numeric = eval(y_bpf);
    [Y2_bpf,f] = fftm(y_bpf_numeric,fs);
    figure
    plot(f*2*pi,abs(Y2_bpf))
    title(['Espectro da Saída Y para Zeta = ' num2str(zeta3(i))]);
    xlabel('Frequencia Angular [rad/s]')
    ylabel('Amplitude')
end




















