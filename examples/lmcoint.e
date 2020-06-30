new;
library westerlundlib;

t       = ??;

// Type of Shift
// 0 = no shift
// 1 = level shift
// 2 = regime shift
mod     = 1;

// Max lags
k       = 10;

// Trimming
tr      = 0.1;

load y[t,1] = c:\??;
load x[t,1] = c:\??;

{ lm, br } = lm_break(y, x, k, mod);
