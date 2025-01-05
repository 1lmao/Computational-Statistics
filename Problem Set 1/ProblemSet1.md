# Problem Set

## 1. Consider the following probability distribution function:

\[
f(x) = 
\begin{cases} 
\frac{1 - \exp(-y^2 / 2)}{y^2 \sqrt{2\pi}}, & y \neq 0, \\ 
\frac{1}{2\sqrt{2\pi}}, & y = 0.
\end{cases}
\]

This distribution is called the Slash distribution, which has been used widely in simulation studies. The shape of the distribution is similar to the standard normal density but has heavier tails. We are interested in generating random samples from the density.

### (a)
Use the alternative CDF method to generate a random sample of size 100 from the density. Plot the density histogram of the random sample. Also, provide the empirical and the theoretical CDF and compare.

### (b)
Now, use an acceptance-rejection method to generate a random sample of size 100 from the density. For candidate distributions, use the normal distributions with mean 0 and standard deviations 3, 4, and 5. Provide the density histogram of each of the random samples and compare it with that in (a). Calculate the probability of rejection. Carefully discuss and compare the normal candidates with different variances.

### (c)
Using the random sample in (b), we are interested in a Monte Carlo test for:

\[
H_0: m = 0 \quad \text{vs.} \quad H_1: m \neq 0.
\]

Here \( m \) is the population median. Carefully describe how you would perform the Monte Carlo test. Calculate the Monte Carlo \( p \)-value and draw a conclusion.

---

## 2. Let \( X_1, X_2, \ldots, X_n \) be i.i.d. Poisson random variables having unknown mean \( \lambda \). For a given constant \( a > 0 \), we are interested in estimating \( \theta = P[\bar{X} \geq a] \). The following hypothesized data records the number of customers at a customer service window for the last 20 1-hour periods:

\[
5, 4, 7, 14, 7, 2, 10, 13, 7, 11, 7, 10, 13, 9, 11, 8, 6, 3, 6, 5
\]

### (a)
Explain how we can use the bootstrap approach to estimate \( \theta \).

### (b)
Use the data to estimate \( \theta \) with \( a = 7 \). Provide the 95% bootstrap confidence interval (CI) and bootstrap percentile interval for \( \theta \). Plot the histogram of the bootstrap estimates. Discuss your findings.
