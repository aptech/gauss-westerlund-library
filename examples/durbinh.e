new;

// regressors
k    = ??;
n    = ??;
t    = ??;

// Max factors
kmax = 5;

// Criterion
cri  = 2;

// Penalty
pen  = 2;

// Bandwidth
p    = int(4*(t/100)^(2/9));

// Load independent variables
// panel dataset
// t x nk matrix
load x[t,n*k] 	= c:\??;

// Panel data of dependent variables
// t x n matrix
load y[t,n] 	= c:\??;

// Call panel test
{ dhg, dgp } = gdh_panel(y, x, kmax, pen, cri, mu_g, mu_p, var_g, var_p);

/* printing options */
format/m1/rd 8,3;

print " ";
print " dh_g = ";;
dhg;
print " dh_p = ";;
dhp;


