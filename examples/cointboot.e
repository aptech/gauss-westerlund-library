new;

t   = ??; 
n   = ??;

// Regressors, k = 5 is max
k = ??;    

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

// Load independent variables t x nk matrix
load x[t,n*k] 	= c:\??;

// Independent matrix t x n
load y[t,n] 	= c:\??;      


i = 1;
l = 0;
do while i <= n;
l = l + lm(y[., i], x[., 1+(i-1)*k:i*k], mod, p);
i = i + 1;
endo;

{ m, v } = mom(mod, k);
lmn = sqrt(n)*(l/n - m)./sqrt(v);
bpv = boot(y, x, mod, est, nb, p);
bpv = counts(bpv, lmn)/nb;

/* printing options */
format/m1/rd 8,3;

print " ";
print " lm statistic = ";; lmn;
print " bootst p-val = ";; (1 - bpv);
print " asymp p-val  = ";; cdfnc(lmn);  


