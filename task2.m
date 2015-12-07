close all
load('SGroup5.mat')
r = StudentData.rcvd;
[f,bin] = hist(r);    % bin and freq

% Compute statistics
sig = std(r);
mu = mean(r);
pdf = normpdf(bin,mu, sig);


for i = 1:4
    Pf(i) = 10^(-1*i)
    v0(i) = sqrt(2)*erfcinv(2*Pf(i));
end

plot(Pf, v0)

% Increasing the threshold, v0, will lower the chances of false alarm since
% the noise is Gaussian. At a high enough threshold, only the noise
% outliers will trigger a false alarm
