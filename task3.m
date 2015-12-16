clear all; close all; clc

% Given Codes
x{1} = [0 1 0 1 0 1 0 1 0 1 0];
x{2} = [0 1 0 0 1 0 0 0 1 1 1];
x{3} = [1 0 1 0 1 1 0 0 1 1 1 1 1];

% Plot auto correlation
figure
sidelobes = zeros(1, length(x));
for i = 1:length(x)
    subplot(length(x),1,i);
    clear Rxx
    x{i} = -(-1).^x{i};    % Make 0 into -1
    [Rxx, peak, sidelobe, ~] = autocorr(x{i});
    plot(Rxx, 'color',rand(1,3)); hold on; grid on;
    sidelobes(i) = sidelobe;
    title(sprintf('Code: %i',i));
    xlabel('Sample')
    ylabel('Level')
end
% Barker codes are good because the sidelobes are minimal
