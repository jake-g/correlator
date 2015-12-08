function [ Rxx, peak, sidelobe ] = autocorr( x )
%autocorr finds autocore vector and sidlobe amplitude
    x = -(-1).^x;    % Make 0 into 1
    Rxx = xcorr(x);  % correlate x with x
    R_sort = sort(abs(Rxx));    % sort to find second max
    sidelobe = R_sort(end - 1)
    peak = R_sort(end)
end

