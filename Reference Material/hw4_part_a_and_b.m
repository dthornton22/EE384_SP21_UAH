Fs=8000; F1= 1209; F2=1336;
dt=1/Fs;
t=0:dt:0.05-dt;

y1=cos(2*pi*F1*t);
y2=cos(2*pi*F2*t);

subplot(3,1,1),plot(Fs*t,y1),title('1209 Hz sine wave');
subplot(3,1,2),plot(Fs*t,y2),title('1336 Hz sine wave');

y = cos(2*pi*F1*t)+ cos(2*pi*F2*t);   %create complete signal from component sinusoids

subplot(3,1,3),plot(Fs*t,y),title('Complete signal x(t)');

%Compute DFT of the Complete Signal
L = length(y);              % Window length
n = pow2(nextpow2(L));      % Next power of 2 from length of y
y_dft= fft(y,n);            % DFT
y_s = fftshift(y_dft);      % Rearrange y values
f = (-n/2:n/2-1)*(Fs/n);    % 0-centered frequency range

figure
plot(f,abs(y_s)/n);

xlabel('Frequency(in Hz)')
title('Magnitude response of the sinusoidal signal');

%% Butterworth Lowpass Filter Design
%  Drop-off is very gradual
Wp = (2*F1)/Fs;
Ws = (2*F2)/Fs;
Rp = 3;
Rs = 40;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn,'low');
yf = filter(b,a,y);

figure;
n=512;          %Default value
freqz(b,a,n,Fs) %n--> Number of evaluation points, n > Filter order

%Magnitude Response of the filtered signal
L = length(yf);              % Window length
n = pow2(nextpow2(L));       % Next power of 2 from length of y
y_dft= fft(yf,n);            % DFT
y_s = fftshift(y_dft);       % Rearrange y values
f = (-n/2:n/2-1)*(Fs/n);     % 0-centered frequency range

figure
plot(f,abs(y_s)/n);

xlabel('Frequency(in Hz)')
title('Magnitude response of the filtered signal using Butterworth filter');

%% Elliptic Lowpass Filter Design
% Now let's look at another kind of filter in Matlab: elliptic or 'Cauer'
% filters. They tend to have steeper rolloffs than a Butterworth, and they
% give you more control over the output of the filter--you decide how much
% ripple you want in the passed frequencies and how much attenuation you
% want in the stopped band.
Wp = (2*F1)/Fs;
Ws = (2*F2)/Fs;
Rp = 3;
Rs = 40;
[n,Wn] = ellipord(Wp,Ws,Rp,Rs);
[b,a] = ellip(n,Rp,Rs,Wn);
yf = filter(b,a,y);

figure;
n=512;          %Default value
freqz(b,a,n,Fs) %n--> Number of evaluation points, n > Filter order

%Magnitude Response of the filtered signal
L = length(yf);              % Window length
n = pow2(nextpow2(L));       % Next power of 2 from length of y
y_dft= fft(yf,n);            % DFT
y_s = fftshift(y_dft);       % Rearrange y values
f = (-n/2:n/2-1)*(Fs/n);     % 0-centered frequency range

figure
plot(f,abs(y_s)/n);

xlabel('Frequency(in Hz)')
title('Magnitude response of the filtered signal using Lowpass Elliptic filter');