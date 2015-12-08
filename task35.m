clear all; close all; clc

codes = [2 3 4 5 7 11 13];
barker13 = barker(13);
code_stats = zeros(length(codes), 3);
for i = 1:length(codes)
%     combined_code = [];     % Combine two codes
%     for j = 1:length(barker(13))
%         combined_code =  [combined_code barker13(j)*barker(codes(i))'];
%     end
    K = kron(barker13,barker(codes(i)));  % combines the codes  
    % Plot Correlation
    subplot(length(codes),1,i); 
    clear Rxx
    [Rxx, peak, peak_side, mean_side] = autocorr(K);
    plot(Rxx, 'color',rand(1,3)); hold on
    title(sprintf('Code: %i',i));  
    
    % Record Statistics
    code_stats(i, :) = [peak, peak_side, mean_side];    % NEED TO RREPRESENT IN DB

end
