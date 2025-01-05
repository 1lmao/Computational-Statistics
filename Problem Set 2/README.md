# Problem Set

![Problem Set 2](https://github.com/1lmao/Computational-Statistics/raw/main/Problem%20Set%202/ps2.png)

### 1. Consider the following probability distribution function:

\[
f(x) = \frac{1}{b} \exp\left[-\frac{(x-a)}{b}\right] \exp\left\{-\exp\left[-\frac{(x-a)}{b}\right]\right\}, \, b > 0.
\]

This distribution is called the Extreme Value distribution \( \text{EV}(a, b) \) with the location parameter \( a \) and the scale parameter \( b \). This distribution has been used widely to model extreme events, for example, annual maximum rainfall. We are interested in generating random samples from the density with \( a = 2 \) and \( b = 1 \).

1. (a) Use any method of your choice to generate a random sample of size 100 from the density. Plot the density histogram of the random sample with the true density superimposed. Also, provide the empirical and the theoretical CDF and compare.

2. (b) Using the random sample in (a), construct a Monte Carlo (MC) for the location parameter \( a \), assuming the scale parameter \( b \) is known as 1. Plot the MC and the density histogram after burn-in. Give the mean, standard deviation, and 95% percentile interval for \( a \). Discuss your findings.

---

### 2. It is known that the distribution of waiting times between events in a Poisson process with intensity \( \lambda \) are \( \text{Exp}(\lambda) \). We would like to use this fact to generate random numbers from \( \text{Poisson}(\lambda) \). Generate events \( X_i = \sum_{j=1}^{i} Y_j \), where \( Y_j \sim \text{Exp}(\lambda) \), and then take \( Z = \#\{X_i : X_i \in [l-1, l)\}, l \geq 1 \), as \( \text{Poisson}(\lambda) \) pseudo-random variables. Write a function to generate \( N \) such random numbers. Using your function, generate \( N = 1000 \) such random numbers with \( \lambda = 1 \). Count the outcomes in the categories \( 0, 1, 2, \dots, 10+ \). Provide the density histogram and compare with the theoretical density. Discuss your findings.

1. (a) Describe how you might do this using a resampling method.

2. (b) Describe how you might do this using a kernel density estimation method.

For each method you used, describe your procedure in detail, write a MATLAB function, and provide results. Compare the results both graphically and numerically.

---

### 3. Consider random variables \( X \) and \( Y \) having the following conditional distributions:

\[
f(x|y) = \exp(-xy), \quad 0 < x < 10,
\]
\[
f(y|x) = x \exp(-xy), \quad 0 < y < 10.
\]

Use a Gibbs sampler to generate MC of size 1000 from the marginal distribution \( f(x) \). Use your own starting values and burn-in period. Estimate the mean, variance, skewness, and kurtosis of the marginal distribution. After burn-in, plot the MC and give the density histogram of the chain. Estimate the marginal pdf \( f(x) \) at \( x = 0.1, 1.8, 3.5, 9.2 \). Repeat this with different starting values and compare.
