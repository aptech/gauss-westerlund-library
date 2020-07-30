new;
library westerlundlib;

// Here we load all data for testing
// Note that this dataset is stacked
// and the procedures
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

// Maximum factors < n
nfmax = 5;      

// Penalty
pen = 2;   

// Criterion for lag selection
// 1 = pc, 2 = ic, 3 = aic/bic
cri = 3;                       

// Bandwidth
p  = int(4*(t/100)^(2/9));    

// Testing
// Two-stage testing
{ b1, adjb1, fmb11, fmb21, s11, s21, nf1 } = tsest(x, y, nfmax, p, pen, cri);

// Iterative testing
{ b2, adjb2, fmb12, fmb22, s12, s22, nf2 } = itest(x, y, nfmax, p, pen, cri);

