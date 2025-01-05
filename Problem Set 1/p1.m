%Problem 1

%a
%Alternative Procedure

randSampl = rand(100, 1);
stpSize = 0.01; 
range=[-10, 10];
i = (range(2) - range(1))/stpSize;
x = linspace(range(1), range(2), i);
n = length(x);
CDF = zeros(1, n);
f = @fun;

for i = 1:n
	a = x(i);
		CDF(i) = integral(f, -inf, a);
end
for i = 1:length(randSampl);
	place = CDF;
	for j=1:n
		if(place(j) < randSampl(i))
			place(j) = 1;
		end
	end
	[c, ind] = min(place);
	rv(i) = x(ind);
end
y = f(x);

%histogram with true density
figure(4)
[N, h] = hist(rv);
N = N/(h(2) - h(1))/100;
subplot(131)
bar(h,N,1,'w'), hold on
plot(x,y,'k'), hold off
title('Slash Random Sample With Alternative Procedure')
xlim([min(x) - 1 max(x) + 1])
 
%emperical
subplot(132)
ecdf(rv)
title('Empirical')

%theoretical
subplot(133)
plot(x, CDF)
title('Theoretical')

%b
mu = 0;
sigma = [3, 4, 5];
z = 100;
x1 = zeros(3,z);
for i = 1: length(sigma)
y = f(0);
g = normpdf(0, mu, sigma(i));

c(i) = (y./g);


%STEP 1 -ACCEPT/REJECT
xy = zeros(1,z);						% y vals
rej = zeros(1,z);						% rejected variates
rejy = zeros(1,z);                      % corresponding y values
irv=1;
irej=1;
while irv <= z
   yi=normrnd(0,sigma(i));
   randSampl = rand(1);
   if randSampl <= f(yi)/(c(i)*normpdf(yi, mu, sigma(i)))
      x1(i,irv)=yi;
      xy(irv) = randSampl*c(i);
      irv=irv+1;
   else
      rej(irej)= yi;
      rejy(irej) = randSampl*c(i); 
      irej = irej + 1;
   end
end

accept(i) = irv/(irv+irej)   %acceptance rate
rejection(i) = 1-accept(i)   %reject rate

%STEP 2 - HISTOGRAM
figure(i)
[N,h]=hist(x1(i,:));
N=N/(h(2)-h(1))/100;
bar(h,N,1,'w')
hold on
xx=-10:0.01:10;
yy=f(xx);
plot(xx,yy,'k');
hold off
title('Histogram')
end


%c
%PART C - MONTE CARLO

%STEP 1 - TEST FOR NORMALITY
 figure(5)
 normplot(x1(1,:))
 title('QQ Plot N(0,3)')
 figure(6)
 normplot(x1(2,:))
 title('QQ Plot N(0,4)')
 figure(7)
 normplot(x1(3,:))
 title('QQ Plot N(0,5)')
% 
% %STEP 2 - SET UP
M = 1000;
alpha = 0.05;

for j = 1:length(sigma)
	med=median(x1(j,:));
	sigma0=sigma(j);
 
	xobs1=(med-0)/(sigma0/sqrt(n));
	xm1=zeros(1,M);
 
	for i=1:M
		xs1 = normrnd(0,sigma0,1,n);
		xm1(i) = (median(xs1) - 0)/(sigma0/sqrt(n));
	end
% %STEP 3 - FIND P-VALUES
 pval(j)=2*min(length(find(xm1>=xobs1)),length(find(xm1<=xobs1)))/M;
end

%{
OUTPUT

Midterm
Warning: MATLAB has disabled some advanced graphics rendering features by switching to
software OpenGL. For more information, click here. 

accept =

    0.1324


rejection =

    0.8676


accept =

    0.1324    0.4742


rejection =

    0.8676    0.5258


accept =

    0.1324    0.4742    0.4208


rejection =

    0.8676    0.5258    0.5792


%}
