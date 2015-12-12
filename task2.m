clear all; close all; clc;

% Plot detection vs SNR
figure
S = 1:100;  % snr
Pfa = 10.^-(1:4);   % false alarm
v0 = sqrt(2)*erfcinv(2*Pfa); % threshhold at false alarm
for i = 1:length(Pfa)
    Pd = 0.5*erfc((v0(i) - sqrt(S))/sqrt(2)); % find detection prob
    semilogx(S, Pd);  hold on

end

% Plot Properties
colormap('winter')
title('Detection vs SNR')
xlabel('SNR (dB)')
ylabel('Detection Probability')
legend('Pfa = 0.1', 'Pfa = 0.01', 'Pfa = 0.001', 'Pfa = 0.0001', 'location', 'southeast')
