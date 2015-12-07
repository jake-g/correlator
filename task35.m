clear all
close all
l = [2 3 4 5 7 11 13];

% Pre-Compute Final Length
len = 1;
for i = 1:length(l)
    len = l(i) * len;
end

start = barker(13)
for i = 1:length(l)
    start = combine(l(i), start);
end
