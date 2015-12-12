% EE 416 project - Task 1
clc;close;clear;

s = barker(13);
k = 1; % arbitrary scalar
h = k * s;

Nt = 1e3;
V_RV = zeros(Nt, 1);
for i=1:Nt
    w = randn(length(s),1);
    r = s + w;
    V = h' * r;
    V_RV(i) = V;
end

v = V_RV / std(V_RV);

% Compute statistics'
[f,bin] = hist(v);    % bin and freq
sig = std(v);
mu = mean(v);
pdf = normpdf(bin,mu, sig);

% Plot
dx = diff(bin(1:2));    % bin width
bar(bin,f/sum(f*dx)); hold on % normalized hist
plot(bin,pdf);  % plot theoretical pdf
title('Histogram for v = V_R_V / std(V_R_V)');
xlabel('V_R_V');
ylabel('Frequency');

% Preform gof test on theoretical pdf
[h,p,st] = chi2gof(v)

% Q value for recieved signal and noise ref
Q = 0.5*erfc(r/sqrt(2));
Qn = 0.5*erfc(w/sqrt(2));
