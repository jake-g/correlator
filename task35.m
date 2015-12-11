clear all; close all; clc

codes = [2 3 4 5 7 11 13];
barker13 = barker(11);
code_stats = zeros(length(codes), 3);
for i = 1:length(codes)
    % Combines the codes  
    K = kron(barker13,barker(codes(i)));  
    
    % Plot Correlation
    subplot(length(codes),1,i); 
    clear Rxx
    [Rxx, peak, peak_side, mean_side] = autocorr(K);
    plot(Rxx, 'color',rand(1,3)); hold on
    title(sprintf('Code: %i',i));  
    
    % Record Statistics
    code_stats(i, :) = [peak, peak_side, mean_side];
    code_db = 20*log10(code_stats);
    soundsc(Rxx)

end
