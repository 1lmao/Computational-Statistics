function[y] = Count(x)

[m,n] = length(x);
y = zeros(n,1);
for i = 1:n
    for j = 1:m
        if x(j,i)>i-1 && x(j,i)<i 
        y(i)=y(i)+1;
        end
    end
end