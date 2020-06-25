new;

k       = ??;                       /* regressors, k = 6 is max */
n       = ??;
t       = ??;
nb      = 1000;                     /* no of bootstrap replications */
mod     = 1;                        /* 1 = nothing, 2 = const, 3 = const & trend */
p       = int(4*(t/100)^(2/9));     /* lags */
q       = int(4*(t/100)^(2/9));     /* leads */
r       = int(4*(t/100)^(2/9));     /* bandwidth */


load x[t,n*k] 	= c:\??;        /* t x n matrix */
load y[t,n] 	= c:\??;        /* t x n matrix */


proc(2) = ecm_panel(y, x, mod, p, q, r);
    i    = 1;
    g    = zeros(2, 1);
    test = zeros(4, 1);
    do until i > n;
        g = g + ecm(x[., 1+(i-1)*k:i*k], y[.,i], mod, p, q, r);
        i = i + 1;
    endo;
    
    { m, v }     = ecmmom(mod, k);
    test[1:2] = sqrt(n)*(g/n-m)./sqrt(v);
    { m, v }     = pecmmom(mod, k);
    test[3:4] = (pecm(x, y, mod, p, q, r) - sqrt(n)*m)./sqrt(v);
    
    i     = 1;
    pval  = zeros(4, 1);
    botcr = boot(y, x, mod, nb, p, q, r);
    do until i > 4;
        pval[i] = counts(botcr[.,i],test[i])/nb;
        i  = i + 1;
    endo;
    
    
    /* printing options */
    format/m1/rd 8,3;
    
    print " ";
    print " g_tau   = ";;
    test[1];;
    (1-cdfnc(test[1]));;
    pval[1];
    print " g_alpha = ";;
    test[2];;
    (1-cdfnc(test[2]));;
    pval[2];
    
    print " p_tau   = ";;
    test[3];;
    (1-cdfnc(test[3]));;
    pval[3];
    print " p_alpha = ";;
    test[4];;
    (1-cdfnc(test[4]));;
    pval[4];
    retp(test, pval);
endp;
