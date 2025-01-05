



%final exam
%question 2
x = exprnd(1,1000,1);
f = @func;
[bootreps, bootsam] = bootstrp(100, f, x); 

%Using bootstrap
f = @func;
C = @Count_Z;
y = exprnd(1,10,1);
n = length(y)+1;
[bootreps1, bootsam1] = bootstrp(1000, f, y);
Z = C(bootreps1);
figure(1)
scatter(0:n, Z);

%Using normal kernel
data = f(y);
n = length(data);
% We will get the density estimate at these x values.
x = linspace(0,11,1000);
fhat = zeros(size(y));
h = 1.06*n^(-1/5);
hold on
for i=1:n
   % get each kernel function evaluated at x
			% centered 		at data
   fx=exp(-(1/(2*h^2))*(x-data(i)).^2)/sqrt(2*pi)/h;
   %plot(x,fx/(n*h));
   fhat = fhat+fx/(n);
end

