clear all; close all

load('SGroup0.mat')
r = StudentData.rcvd;
w = StudentData.refnoise;

corr = abs(filter(flipud(barker(13)), 1, r));
subplot(2,1,2); plot(corr)
title('Filtered')
subplot(2,1,1); plot(r)
title('Original')
winners = find((corr>25)) - 12
