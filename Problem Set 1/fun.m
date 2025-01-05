function[y] = fun(x)
for i = 1:length(x)
if x(i) ~= 0
y = (1-exp(-x.^2/2))./(x.^2*sqrt(2*pi));
else
y = 1/(2*sqrt(2*pi));
end
end

