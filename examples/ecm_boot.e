new;

k       = ??;                       /* regressors, k = 6 is max */
n       = ??;
t       = ??;
nb      = 1000;                     /* no of bootstrap replications */
mod     = 1;                        /* 1 = nothing, 2 = const, 3 = const & trend */
p       = int(4*(t/100)^(2/9));     /* lags */
q       = int(4*(t/100)^(2/9));     /* leads */
r       = int(4*(t/100)^(2/9));     /* bandwidth */

// Load data
load x[t, n*k] 	= c:\??;        /* t x n matrix */
load y[t, n] 	= c:\??;        /* t x n matrix */

// Run the test
{ test, pval } = ecm_panel(y, x, mod, p, q, r);
