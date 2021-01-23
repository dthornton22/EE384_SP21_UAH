% plotMrmRetLog.m
% This script prompts the user for a MRM-RET logfile, reads, parses, and
% produces a "waterfall plot" of the motion filtered scans and detection lists 
% in the logfile
clear all; close all; clc

%% Query user for logfile
%dnm = '.'; fnm = 'MRM_002.csv';
[fnmb,dnmb] = uigetfile('*.csv');
fprintf('Reading logfile %s\n',fullfile(dnmb,fnmb));
[cfgb,reqb,scnb,det] = readMrmRetLog(fullfile(dnmb,fnmb));

[fnmt,dnmt] = uigetfile('*.csv');
fprintf('Reading logfile %s\n',fullfile(dnmt,fnmt));
[cfgt,reqt,scnt,dett] = readMrmRetLog(fullfile(dnmt,fnmt));

%% Separate raw, bandpassed, and motion filtered data from scn structure
% (only motion filtered is used)

%% Pull out the raw scans (if saved)
rawscansIb = find([scnb.Nfilt] == 1);
rawscansV_background = reshape([scnb(rawscansIb).scn],[],length(rawscansIb))';

rawscansIt = find([scnt.Nfilt] == 1);
rawscansV_target = reshape([scnt(rawscansIt).scn],[],length(rawscansIt))';

scan_difference6 = abs(rawscansV_background - rawscansV_target);

%% Create the waterfall horizontal and vertical axes
Tbin = 32/(512*1.024);  % ns
T0 = 0; % ns
c = 0.29979;  % m/ns
Rbin = c*(Tbin*(0:size(scan_difference6(1,:),2)-1) - T0)/2;% Range Bins in meters

%Background plot
plot(Rbin,rawscansV_background(10,:))  
%Taget plot
figure; plot(Rbin,rawscansV_target(10,:))
% Difference plot
figure;plot(Rbin,scan_difference6(10,:))

%[a05,i] = max(scan_difference(10,100:122)); %In a range of distance values
%Rbin=i+99;                                  %100=0.9m, 122=1.1m
[a6,i]=max(scan_difference6(10,:));
%distance = Rbin(i)
noise_sample = scan_difference(10,125:175);

noise_var = var(noise_sample);
SNR6= 10*log10(a6^2/noise_var);
PII=2.^(6:15);
