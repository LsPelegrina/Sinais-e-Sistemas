% Modified fft algorithm
%
% This function estimates the fft of a signal x using the Fs sampling
% frequency, NFFT bins, and returns the frequencies values along with the spectrum X.
%
% [X,f] = fftm(x,Fs,NFFT)
%
% Example:
% Fs = 1e3;
% t = 0:0.001:1-0.001;
% x = cos(2*pi*100*t)+sin(2*pi*202.5*t);
% [X,f]=fftm(x,Fs,2000);
% plot(f,abs(X));

% http://www.mathworks.com/help/signal/ug/amplitude-estimation-and-zero-padding.html
% http://www.mathworks.com/help/signal/ug/psd-estimate-using-fft.html

function [xdft,f, psdx] = fftm(x,Fs,NFFT)

L = length(x);
if nargin < 3
    NFFT = 2^nextpow2(L);
end
xdft = fft(x,NFFT);
xdft = xdft(1:length(xdft)/2+1);

psdx = (1/(Fs*L)).*abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
psdx = 10*log10(psdx);

xdft = 1/L.*xdft;
xdft(2:end-1) = 2*xdft(2:end-1);
f = 0:Fs/NFFT:Fs/2;


