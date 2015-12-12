clear all; close all

% Get results from task 2
run('task2.m');
run('group0_ans.m');
load('SGroup5.mat')


r = StudentData.rcvd;
w = StudentData.refnoise;
mu_r = mean(r)
std_r = std(r)


thresh = 2* std_r^2 * v0(4) + mu_r +6

subplot(2,1,1); plot(r)
title('Original')
corr = 12 + abs(filter(flipud(barker(13)), 1, r));
subplot(2,1,2); plot(corr); hold on;    

winners = find((corr > thresh));
length(winners)

% plot thresh
plot([0, length(corr)], [thresh, thresh]); hold on;  
% plot detected
stem(winners, corr(winners))
% hold on;    % plot answers to expose missed or false positives
% stem(epochs + 12 , corr(epochs + 12), '*');


% Plot properties
title('Filtered')
xlim([0,length(corr)])
ylim([min(corr), max(corr)])
xlabel('Sample')
ylabel('Level')