%set up tiem anjd freq domain axis
M = 100; % 100 samples
n = [0:M-1]; % array of values
N = 1000; % length of DFT
t = [0:N-1]; % time axis
w = [0 : 2*pi/N : pi]; % freq axis up to f/2

%set up sig
T = 10;  % sinewave period
x = sin(2*pi*n/T); % first 100 samples (length of M)
x = [x, zeros(1, N-M)]; % zero pad if need
% current sig not padded as N=M

%window
M = 100; %window width
%win = hamming(M); % Hamming window (column vector)
%win = blackman(M); % Blackman window
win = boxcar(M);
win = [win', zeros(1, N-M)]; % Zero-pad  window to row vector, length N
xwin = x.*win; % Apply window to signal x using element-wise multiplication

subplot(2, 1, 1); stem(t,xwin);grid on;
title('Signal xwin stem'); xlabel('time'); ylabel('x');
subplot(2, 1, 2); plot(t,xwin); grid on;
title('Signal xwin plot'); xlabel('time'); ylabel('x');

% FT for sig up to f/2
f_domain = abs(fft(xwin, N)); % mag of dft
dB_f_domain = 20*log10(f_domain); % dB mag, y-axis

figure(2) %plots new window
subplot(2, 1, 1); stem(w, f_domain(1:N/2+1)); grid on; % plot magnitude in upper graph
title('Stem of |DFT| vs Frequency'); xlabel('Frequency (Hz)'); ylabel('|DFT|');
subplot(2, 1, 2); plot(w, dB_f_domain(1:N/2+1)); grid on; % plot dB in lower graph
title('Plot of dB vs frequency'); xlabel('Frequency (Hz)'); ylabel('dB');


