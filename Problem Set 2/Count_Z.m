function[y] = Count_Z(x)

[m,n] = size(x);
y = zeros(n+1,1);
for i = 1:n
    for j = 1:m
        if x(j,i)>i-1 && x(j,i)<i 
        y(i)=y(i)+1;
        end

    end
end

for k = 1:m 
    if x(j,n) > n
        y(n+1) = y(n+1) + 1;
    end
end