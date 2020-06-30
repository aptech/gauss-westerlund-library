new;
library westerlundlib;

t       = ??;
n       = ??;
k       = ??;              /* k = 5 is max */

p       = int(t^(1/3));     /* bandwidth */
t0      = 0.1;              /* trimming */
mod     = 2;                /* 1 = cont and 2 = trend */

load x[t, k*n]   = c:\??;    /* t x kn matrix */
load y[t, n]     = c:\??;    /* t x n matrix */


