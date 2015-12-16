clear all; close all

% Get results from task 2
run('task2.m');
run('group0_ans.m');
load('SGroup0.mat')

r = StudentData.rcvd;
w = StudentData.refnoise;

% Auto-Correlation
subplot(3,1,1); plot(r, 'color',rand(1,3))
title('Original')
corr = abs(filter(flipud(barker(13)), 1, r));

% Theoretical threshold (based off noise and hyp test)
thresh_th = v0(4)* sqrt(13*var(w));
hit_th = find((corr > thresh_th));
length(hit_th)

% plot thresh
subplot(3,1,2); plot(corr, 'color',rand(1,3)); hold on;   
plot([0, length(corr)], [thresh_th, thresh_th]); hold on;  
stem(hit_th, corr(hit_th))

% Plot properties
title('Filtered with Theoretical Treshold')
xlim([0,length(corr)])
ylim([min(corr), max(corr)])
xlabel('Sample')
ylabel('Level')


% Cheat threshold (need full signal, not realtime)
corr_sort = sort(abs(corr));    % set thresh at 10th max
thresh_m = corr_sort(end - 10)
hit_m = find((corr > thresh_m));
length(hit_m)

% plot thresh
subplot(3,1,3); plot(corr, 'color',rand(1,3)); hold on;   
plot([0, length(corr)], [thresh_m, thresh_m]); hold on;  
stem(hit_m, corr(hit_m))

% Plot properties
title('Filtered with Measured Treshold')
xlim([0,length(corr)])
ylim([min(corr), max(corr)])
xlabel('Sample')
ylabel('Level')