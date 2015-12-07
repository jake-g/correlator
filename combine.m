function [ out ] = combine( m, in )
%combine combines two barkers to make a longer fake barker

b = barker(m);
out = zeros(m*length(in), 1);
length(out)
for i = m:m:length(out)
    k = i/m;
    for j = 1:length(b)
        out(i+j-2) = b(j)*in(k);
    end
end


