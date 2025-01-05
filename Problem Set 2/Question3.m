

%Final Exam
%question 3

n = 1800;
burn = 800;
x = zeros(n,1);
y = zeros(n,1);
%change values for x(1) two times
x(1) = 0.01;
y(1) = exprnd(1/x(1));
while y(1)<=0||y(1)>=10
      y(1)=exprnd(1/x(1));
end

for i = 2:n
    while x(i)<=0||x(i)>=10
        x(i) = exprnd(1/y(i-1));
    end
    
    while y(i)<=0||y(i)>=10
    y(i) = exprnd(1/x(i));
    end
end

%Markov Chains
xMKChain=x(burn+1:n);
n1=length(xMKChain);
yMKChain=y(burn+1:n);
n2=length(yMKChain);

%Estimates
meanMKChain=[mean(xMKChain) mean(yMKChain)]
varMKChain=[var(xMKChain) var(yMKChain)]
skewMKChain=[skewness(xMKChain) skewness(yMKChain)]
kurtMKChain=[kurtosis(xMKChain) kurtosis(yMKChain)]

%Figures
figure(1)
subplot(2,1,1)
plot(xMKChain)
title('xMKChain')
subplot(2,1,2)
plot(yMKChain)
title('yMKChain')

figure(2)
subplot(121)
[N,h]=hist(xMKChain);
N=N/(h(2)-h(1))/n1;
bar(h,N,1,'w')
title('x Dens. Hist')

subplot(122)
[N,h]=hist(yMKChain);
N=N/(h(2)-h(1))/n2;
bar(h,N,1,'w')
title('y Dens. Hist.')

%Run values
xranVals=[0.1 1.8 3.5 9.2];
fhatz = zeros(1,length(xranVals));
for j = 1:length(xranVals)
    fhatz(j) = mean(exppdf(xranVals(j),1./yMKChain));
end

%{
OUTPUT FOR X(1)=0.01
Question3

meanMKChain =

    1.9637    1.8449


varMKChain =

    5.8723    5.9026


skewMKChain =

    1.4814    1.6411


kurtMKChain =

    4.2944    4.7988

OUTPUT FOR X(2)= 0.5
Question3

meanMKChain =

    1.9212    1.8913


varMKChain =

    6.0814    6.0152


skewMKChain =

    1.5427    1.6222


kurtMKChain =

    4.3825    4.7521

%}
