new;
library westerlundlib;

t   = ??;
n   = ??;

// Regressors, k = 5 is max
k = ??;

// Number of bootstrap replications
nb = 100;

// lag length and bandwidth
p = int(4*(t/100)^(2/9));

// Model
// 1 = constant
// 2 = constant and trend
mod = 1;

// Sieve estimation
// 1 = OLS
// 2 = Yule-Walker
est = 2;

// Load independent variables t x nk matrix
load x[t,n*k] 	= c:\??;

// Independent matrix t x n
load y[t,n] 	= c:\??;

{ lmn, pval } = boot_panel(y, x, est, mod, p, nb);


