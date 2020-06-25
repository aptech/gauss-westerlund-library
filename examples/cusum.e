// k = 5 is max
k    = ??;
t    = ??;
n    = ??;

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

// Load independent variables
// panel dataset
// t x nk matrix
load x[t, n*k] 	= c:\??.txt;

// Panel data of dependent variables
// t x n matrix
load y[t,n] 	= c:\??.txt;

cus = cusum_panel(y, x, mod, fm, p);

/* printing options */
format/m1/rd 8,3;

print " ";
print " cusum = ";;
cus;
print " sign  = ";;
cdfnc(cus);



