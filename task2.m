clear all; close all; clc;

% Calculate Variables
S = 1:100;  % snr
Pfa = 10.^-(1:4);   % false alarm
v0 = sqrt(2)*erfcinv(2*Pfa); % threshhold at false alarm
table = [Pfa' v0']; % for report

% v0 vs Pfa plot
figure
plot(v0,Pfa, 'r')

% Plot Properties
title('P_f_a vs v_0')
xlabel('Threshold')
ylabel('False Alarm Probability')


% Pd vs SNR
figure
for i = 1:length(Pfa)
    Pd = 0.5*erfc((v0(i) - sqrt(S))/sqrt(2)); % find detection prob
    semilogx(S, Pd);  hold on
end

% Plot Properties
title('P_d vs SNR')
xlabel('SNR (dB)')
ylabel('Detection Probability')
legend('P_f_a = 0.1', 'P_f_a = 0.01', 'P_f_a = 0.001', 'P_f_a = 0.0001', 'location', 'southeast')
