function[y] = func(x)
w = length(x);
y = zeros(w,1);

for k = 1:w
   y(k) = sum(x(1:k)); 
end




