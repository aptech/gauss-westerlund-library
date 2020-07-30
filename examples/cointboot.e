new;
library westerlundlib;

// Here we load all data for testing
// Note that this dataset is stacked
// and the cointboot procedure
// requires wide panel data
data = loadd(__FILE_DIR $+ "brics.xlsx", "code + lco2 + ly");

// Time periods
t = 29;
ncross = rows(data)/t;
k = (cols(data)-2);

// Convert dependent data
// from stacked to wide
y = reshape(data[., 2], ncross, t)';

// Convert independent data
// from stacked to wide
x = reshape(data[., 3]', ncross*k, t)';


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

{ lmn, pval } = boot_panel(y, x, est, mod, p, nb);


