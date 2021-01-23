% plotMrmRetLog.m 
% This script prompts the user for a MRM-RET logfile of background and target
% reads, parses, and detection lists in the logfile 
clear all; close all; clc

%% Query user for logfile
[fnmb,dnmb] = uigetfile('*.csv'); 
fprintf('Reading logfile1 %s\n',fullfile(dnmb,fnmb)); 
[cfgb,reqb,scnb,detb] = readMrmRetLog(fullfile(dnmb,fnmb)); 

[fnmt,dnmt] = uigetfile('*.csv'); 
fprintf('Reading logfile2 %s\n',fullfile(dnmt,fnmt)); 
[cfgt,reqt,scnt,dett] = readMrmRetLog(fullfile(dnmt,fnmt));

%% Pull out the raw scans
rawscansI = find([scnb.Nfilt] == 1); 
rawscansV_background = reshape([scnb(rawscansI).scn],[],length(rawscansI))'; 

rawscansI1 = find([scnt.Nfilt] == 1); 
rawscansV_target = reshape([scnt(rawscansI).scn],[],length(rawscansI))'; 

scan_difference = abs(rawscansV_background-rawscansV_target);

%% Create the horizontal and vertical axes
Tbin = 32/(512*1.024); % ns 
T0 = 0; % ns 
c = 0.29979; % m/ns 
Rbin = c*(Tbin*(0:size(scan_difference(1,:),2)-1) - T0)/2; % Range Bins in meters 

figure;plot(Rbin,scan_difference)
figure;plot(Rbin,scan_difference(10,:))
%% 6. To plot the spectrum of the signal
x = scan_difference(10,:);  % Sample Data

L = length(x);              % Window length
n = pow2(nextpow2(L));      % Next power of 2 from length of y
y_dft= fft(x,n);            % DFT
y_s = fftshift(y_dft);      % Rearrange y values
Ts = Tbin*1e-9;             % Tbin is given in nsec
fs = 1/Ts;
f = (-n/2:n/2-1)*(fs/n);    % 0-centered frequency range
fnz=(0:n-1)*(fs/n);         % Nonzero-centered frequency range
figure; plot(fnz,abs(y_dft)/n)  %6c(i)
figure; plot(f,abs(y_s)/n)      %6c(iii)
%% 7. Design Lowpass filter
%% Butterworth Lowpass Filter Design
%  Drop-off is very gradual
fpass = 4.9e9; fstop = 5.6e9;
Wp = (2*fpass)/fs;
Ws = (2*fstop)/fs;
Rp = 1;
Rs = 20;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn,'low');
yf = filter(b,a,x);

figure; plot(Rbin,yf,Rbin,x);
legend('Filtered Signal','Original Sample data')

%% Butterworth Highpass Filter Design
%  Drop-off is very gradual
fpass = .1e9; fstop = .05e9;
Wp = (2*fpass)/fs;
Ws = (2*fstop)/fs;
Rp = 1;
Rs = 20;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn,'high');
yfh = filter(b,a,yf);

figure; plot(Rbin,yfh,Rbin,x,Rbin,yf)
legend('High-Pass Filtered','Original Sample data','Low-Pass Filtered Signal')