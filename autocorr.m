function [ Rxx, peak, peak_side, mean_side ] = autocorr( x )
%autocorr finds autocore vector and sidlobe amplitude
    Rxx = xcorr(x);  % correlate x with x
    R_sort = sort(abs(Rxx));    % sort to find second max
    peak_side = R_sort(end - 1);
    peak = R_sort(end);
    mean_side = (sum(R_sort) - peak)/(length(R_sort)-1);
end

