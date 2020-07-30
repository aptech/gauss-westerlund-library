new;
library westerlundlib;

n = 16;

// Load data
dat = loadd(__FILE_DIR $+ "panelcoint.dat");

// K = 5 is max
k = 5;

// Dependent variables (t x n matrix)
y = dat[., 1:n];

// Independent variables (t x kn matrix)
x = dat[., n+1:cols(dat)];

// Dimensions
t = rows(y);

// Type of Shift
// 0 = no shift
// 1 = level shift
// 2 = regime shift
mod     = 1;

// Max lags
k       = 10;

// Trimming
tr      = 0.1;

{ lm, br } = lm_break(y, x, k, mod);
