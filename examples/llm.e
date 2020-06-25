new;
n    = ??;
t    = ??;
// K = 5 is max
k    = ??;

// Model deterministic component type
// 0 = nothing
// 1 = const
// 2 = constant & trend
// 3 = break in constant
// 4 = break in constant & treand
mod  = 3;

// Estimation type
// 1 = dols
// 2 = fmols
est  = 2;

// Max number of breaks
m    = 5;

// Trimming values in percent
tri  = 0.15;

// Minimum length of a segment
seg  = int(tri*t);

// Maximum number of iterations to obtain min ssr
ite  = 20;

// Critical values for convergence
cri  = 0.0001;

// Dependent variables (t x n matrix)
load y[t, n]   = c:\??;

// Independent variables (t x kn matrix)
load x[t, k*n] = c:\??;

{ lmi, bri } = lmbreak_panel(y, x, mod, est, seg, m, cri, ite);
