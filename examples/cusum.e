new;
library westerlundlib;

// Here we load all data for testing
// Note that this dataset is stacked
// and the cusum_panel procedure
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

// Model specification
// 0 = nothing
// 1 = const
// 2 = const and trend
mod  = 1;

// 0 = dols
// 1 = fmols
fm   = 0;

// Lags and leads in dols
p    = 2;

// Bandwidth
q    = int(t^(1/3));

cus = cusum_panel(y, x, mod, fm, p);

/* printing options */
format/m1/rd 8,3;

print " ";
print " cusum = ";;
cus;
print " sign  = ";;
cdfnc(cus);



