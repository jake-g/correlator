close all
load('SGroup5.mat')
r = StudentData.rcvd;
w = StudentData.refnoise;
n = length(r);
[f,bin] = hist(r);    % bin and freq

figure
plot(r)
% v = max(w)

% Compute statistics
sig = std(r);
mu = mean(r);
pdf = normpdf(bin,mu, sig);

% Compute threshholds 
for x = 1:4     % log constant for Pf
    Pf(x) = 10^(-1*x);  % compute Pf
    v0(x) = sqrt(2)*erfcinv(2*Pf(x));   % find threshhold v0 from Pf
    total(x) = sum(r(:)>v0(x));     % find instances in rcvd signal > than v0
end
Pd = total./n; % compute probabilities for each v0     

% Pf vs v0
figure
plot(v0, Pf, 'r'); hold on;
plot(v0, Pd, 'b');
% Increasing the threshold, v0, will lower the chances of false alarm and
%  detection since the noise is Gaussian. At a high enough threshold, only 
% the noise outliers will trigger a false alarm
