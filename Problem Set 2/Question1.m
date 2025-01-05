%Final Exam
%1 a) the method used is the alternative procedure
%Alternative Procedure

randSampl = rand(100, 1);
stpSize = 0.01; 
range=[-10, 10];
i = (range(2) - range(1))/stpSize;
x = linspace(range(1), range(2), i);
n = length(x);
CDF = zeros(1, n);
f = @(y)exp(-(y-2)).*exp(-exp(-(y-2)));

for i = 1:n
	a = x(i);
		CDF(i) = integral(f, -200, a);
end
for i = 1:length(randSampl)
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
bar(h,N,1,'w'), hold on
plot(x,y,'k'), hold off
title('Dens. Hist')
xlim([-5 10])

%CDF
%emperical
figure(2)
hold on
ecdf(rv)

%theoretical
theocdf=1-evcdf(-x,-2,1);
plot(x, theocdf)
title('CDF')
axis([-5 10 0 1.1])
hold off


%b)
%method (MCMC)
%initialize parameters for Markov chain
n1 = 1000;
x = zeros(1,n1);
burn = 100;
x(1) = rand;
mix = 0;

strg = 'evpdf(-x,-a,1)';
L = inline(strg, 'x', 'a');

for i = 2:n1
    y=normrnd(2,0.10);    
    u = rand(1);
    alpha = min([1, prod(L(rv, y))/prod(L(rv, x(i-1)))]);
    if u <= alpha
        x(i) = y;
        mix = mix + 1;
    else
        x(i) = x(i-1);
    end
end

mkChain  = x(burn + 1:n1);
n2 = length(mkChain);

figure(3)
subplot(2,1,2);
plot(mkChain)
subplot(2,1,1);
[N,h]=hist(mkChain);
N=N/(h(2)-h(1))/n2;
bar(h,N,1,'w')

mix = mix/n1
meanMKChain = mean(mkChain)
sdMKChain = std(mkChain)

% 95% CI
alpha = 0.05;
k = round(n2*alpha/2);

srtChain = sort(mkChain);
loChain = srtChain(k);
hiChain = srtChain(n2-k);

PI = [loChain hiChain]

%{
Question1

mix =

    0.7900


meanMKChain =

    2.0033


sdMKChain =

    0.0705


PI =

    1.8534    2.1365
%}




