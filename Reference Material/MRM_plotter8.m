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
rawscansI = find([scnb.Nfilt] == 1);
rawscansV_background = reshape([scnb(rawscansI).scn],[],length(rawscansI))';

rawscansI1 = find([scnt.Nfilt] == 1);
rawscansV_target = reshape([scnt(rawscansI1).scn],[],length(rawscansI1))';

scan_difference = abs(rawscansV_background(1:30,:) - rawscansV_target(1:30,:));

%% Create the waterfall horizontal and vertical axes
Tbin = 32/(512*1.024);  % ns
T0 = 0; % ns
c = 0.29979;  % m/ns
Rbin = c*(Tbin*(0:size(scan_difference(1,:),2)-1) - T0)/2;% Range Bins in meters

rbin = 90;
%Background plot
% plot(rbin,rawscansV_background(10,:))  
%Taget plot
figure; plot(Rbin,rawscansV_target(10,:))
% Difference plot
figure;plot(Rbin,scan_difference(10,:))

[a,i]=max(scan_difference(10,:)); 
distance=Rbin(i)