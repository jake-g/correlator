clear all; close all
% Given Codes
x{1} = [0 1 0 1 0 1 0 1 0 1 0];
x{2} = [0 1 0 0 1 0 0 0 1 1 1];
x{3} = [1 0 1 0 1 1 0 0 1 1 1 1 1];

figure
for i = 1:length(x)
    subplot(length(x),1,i);
    [Rxx, sidelobe] = autocorr(x{i});
    plot(Rxx, 'color',rand(1,3)); hold on
    sidelobes(i) = sidelobe;
end

% Barker codes are good because the sidelobes are minimal
