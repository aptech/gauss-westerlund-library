new;
library westerlundlib;

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

{ b1, n2 } = brei_panel(y, x, mod);






