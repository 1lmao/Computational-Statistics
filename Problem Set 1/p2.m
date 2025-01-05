x=[5 4 7 14 7 2 10 13 7 11 7 10 13 9 11 8 6 3 6 5];
n = length(x);
alpha = 0.05;
B 	= 200; % samples of data
b	= 100; % # of bootstraps
k 	= 100; % actual bootstrap

% Get the bootstrap replicates and samples.
thetahat=zeros(1,b);
sehats=zeros(1,B);
zvals=zeros(1,B);
tlo=zeros(1,b);
thi=zeros(1,b);
blo=zeros(1,b);
bhi=zeros(1,b);

[bootreps] = bootstrp(b,'mean',x);
l = 0;
for j = 1:b
	if bootreps(j)>= 7
		l=l+1;
	end
end
theta = l/b;

for p=1:B
[bootreps, bootsam] = bootstrp(b,'mean',x);
l=0;
for j = 1:b
	if bootreps(j)>= 7
		l=l+1;
	end
%SE = std(bootreps);
%thetahat(p)= l/B
end

thetaHat(p) = l/b;

for i=1:b
	xstar = x(bootsam(:,i));
	%sehats(i) = std(bootstrp(50,'mean',xstar));
	breps(i,:) = bootstrp(k, 'mean', xstar);
	%zvals (i)= (bootreps(i)- mean(bootreps))./sehats(i);
	theta2(i) = length(find(breps(i,:) > 7))/k;
end
%k = B*alpha/2;
%szval = sort(zvals);
%tlo(p) = szval(k);
%thi(p) = szval(B-k);
%sbootreps = sort(bootreps);
%blo(p) = sbootreps(k);
%bhi(p) = sbootreps(B-k);
sehats(B) = std(theta2);
end
%maintheta=mean(thetahat)
%BigSE=mean(SE)
%Bigthi=mean(thi)
%Bigtlo=mean(tlo)
% Get the endpoints of the interval.
%blo = maintheta - Bigthi*BigSE
%bhi = maintheta - Bigtlo*BigSE
%
%blow2=mean(blo)
%bhi2=mean(bhi)

SE = std(thetaHat);

zvals = (thetaHat- theta)./sehats;


k = B*alpha/2;
sortZVals = sort(thetaHat);
tlo = sortZVals(k);
thi = sortZVals(B-k);
%sbootreps = sort(bootreps);
blo = theta-thi*SE;
bhi = theta-tlo*SE;
CI = [blo, bhi]

subplot(211)
thetaNew = theta - sortZVals*SE;
hist(thetaNew)
title('Histogram Boostrap-t')

thetaSort = sort(thetaHat);
blo2 = sortZVals(k);
bhi2 = sortZVals(B-k); 
CI = [blo2, bhi2]

subplot(212)
hist(thetaHat)
title('Histogram Boostrap-percent')

%{
OUTPUT
Midterm2

CI =

    0.9029    0.9061


CI =

    0.8300    0.9400
%}