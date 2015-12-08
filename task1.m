clear all; close all; clc;

load('SGroup5.mat')
r = StudentData.rcvd;
w = StudentData.refnoise;


% Compute statistics'
[f,bin] = hist(r);    % bin and freq
sig = std(r);
mu = mean(r);
pdf = normpdf(bin,mu, sig);

% Plot
dx = diff(bin(1:2));    % bin width
bar(bin,f/sum(f*dx)); hold on % normalized hist
plot(bin,pdf);  % plot theoretical pdf

% Preform gof test on theoretical pdf
[h,p,st] = chi2gof(r)

% Q value for recieved signal and noise ref
Q = 0.5*erfc(r/sqrt(2));
Qn = 0.5*erfc(w/sqrt(2));
%% OUTPUT
% h =  0
% 
% 
% p = 6.9278e-01
% 
% 
% st = 
%     chi2stat: 3.8809e+00
%           df: 6
%        edges: [-6.1397e+00 -3.7330e+00 -2.5296e+00 -1.3263e+00 -1.2294e-01 1.0804e+00 2.2838e+00 3.4871e+00 4.6905e+00 5.8938e+00]
%            O: [23 53 151 211 252 175 98 28 9]
%            E: [2.1883e+01 6.0615e+01 1.4095e+02 2.2375e+02 2.4254e+02 1.7954e+02 9.0737e+01 3.1300e+01 8.6871e+00]