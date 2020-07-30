new;
library westerlundlib;

// Here we load all data for testing
// Note that this dataset is stacked
// and the ecm_panel procedure
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
nb      = 1000;   

// Model specification
// 1 = Nothing
// 2 = Constant
// 3 = Constant & Trend
mod     = 1;    

// Lags
p       = int(4*(t/100)^(2/9));    

// Leads
q       = int(4*(t/100)^(2/9));    

// Bandwidth
r       = int(4*(t/100)^(2/9));     

// Run the test
{ test, pval } = ecm_panel(y, x, mod, p, q, r);
