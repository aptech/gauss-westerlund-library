new;

// k=7 is max
k    = ??;                     
n    = ??;
t    = ??;

// Specify model
// 1 = constant
// 2 = constant and trend
mod  = 1;                      

// Independent variable matrix
// is t x nk
load x[t, n*k] 	= c:\??;        

// Dependent matrix is t x n
load y[t, n] 	= c:\??;      

i  = 1;
b1 = 0;

do until i > n;

b1 = b1 + brei(y[., i], x[., 1+(i-1)*k:i*k], mod);         

i = i + 1;
    
endo;


{ mu, var } = breimom(mod, k);
b1 = sqrt(n)*(b1/n - mu)/sqrt(var);

{ mu, var } = pbreimom(mod, k);
b2  = sqrt(n)*(pbrei(y, x, mod) - mu)/sqrt(var);   

format/m1/rd 8,3;
print " ";
print " vr_g = ";; b1;
print " vr_p = ";; b2;






