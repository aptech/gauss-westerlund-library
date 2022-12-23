new;
library westerlundlib;

// Here we load all data for testing
// Note that this dataset is stacked
// and the ecm_panel procedure
// requires wide panel data
data = loadd(__FILE_DIR $+ "esb.xlsx", "code+lnco2per+lnhc+lnec");

// Time periods
t = 26;
ncross = rows(data)/t;
k = (cols(data)-2);

// Convert dependent data
// from stacked to wide
y = reshape(data[., 2], ncross, t)';

// Convert independent data
// from stacked to wide
xtmp2 = zeros(t, ncross*k);
for j (1, ncross, 1);
    xtmp2[., (j-1)*k+1:j*k] = selif(data[., 3:cols(data)], data[., "code"] .== j);
endfor;

// Number of bootstrap replications
nb      = 1000;   

// Model specification
// 1 = Nothing
// 2 = Constant
// 3 = Constant & Trend
mod     = 2;    

// Lags
p       = int(4*(t/100)^(2/9));    

// Leads
q       = int(4*(t/100)^(2/9));    

// Bandwidth
r       = int(4*(t/100)^(2/9));     

// Run the test
{ test, pval } = ecm_panel(y, xtmp2, mod, p, q, r);
