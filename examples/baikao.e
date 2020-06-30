new;
library westerlundlib;

n = ??;
t = ??;
k = ??;

// Maximum factors < n
nfmax = 5;      

// Penalty
pen = 2;   

// Criterion for lag selection
// 1 = pc, 2 = ic, 3 = aic/bic
cri = 3;                       

// Bandwidth
p  = int(4*(t/100)^(2/9));    

// Independent variables should be
// a t x kn matrix
load x[t, k*n] = c:\??.txt;    

// Dependent matrix should be t x n
load y[t, n] = c:\??.txt;  

// Testing
{ b1, adjb1, fmb11, fmb21, s11, s21, nf1 } = tsest(x, y, nfmax, p, pen, cri);
{ b2, adjb2, fmb12, fmb22, s12, s22, nf2 } = itest(x, y, nfmax, p, pen, cri);

/* printing options */
format/m1/rd 8,4;

print " ";
print " t = ";; t;  
print " n = ";; n;
print " ";
print " two-stage b/s: ";
print " ols ";; b1;; s21;
print " adj ";; adjb1;; s11;
print " fm  ";; fmb11;; s11;
print " fma ";; fmb21;; s21;
print " fn  ";; nf1;
print " ";
print " iter b/s: ";
print " ols ";; b2;; s22;
print " adj ";; adjb2;; s12;
print " fm  ";; fmb12;; s12;
print " fma ";; fmb22;; s22;
print " fn  ";; nf2;
