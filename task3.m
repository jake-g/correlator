
x{1} = [0 1 0 1 0 1 0 1 0 1 0];
x{2} = [0 1 0 0 1 0 0 0 1 1 1];
x{3} = [1 0 1 0 1 1 0 0 1 1 1 1 1];

figure
for i = 1:length(x)
    clear Rxx
    x{i} = -(-1).^x{i};    % Make 0 into 1
    Rxx = xcorr(x{i});
    subplot(length(x),1,i); plot(Rxx, 'color',rand(1,3)); hold on
    Rxx = sort(Rxx);
    sidelobe(i) = Rxx(end - 1);
    
end

% Barker codes are good because the sidelobes are minimal
