new;
t       = ??;
n       = ??;
rule    = 2;                /* 1 = sic, 2 = aic, 3 = hiq, 4 = pic, 5 = fic */
mod     = 2;                /* 1 = nothing, 2 = const, 3 = const & trend */
pmax    = 5;                /* max lag */
qmax    = 5;                /* max lead */
bw      = int(t^(1/3));	    /* bandwidth */

load x[t,n] = c:\??;        /* t x n matrix */
load y[t,n] = c:\??;        /* t x n matrix */



/* non-syst est */
//  Lags and leads
{ p, q }                       = ic(x, y, pmax, qmax, mod, rule);    

// Unrestricted dols b, t
// Unrestricted dsur b & t
// Restricted dols b & t
// Restricted dsur b & t
{ uo, us, ro, rs }               = est(x ,y, mod, p, q, bw);        

// System estimation
{ psys, qsys }                 = icsys(x, y, pmax, qmax, mod, rule);
{ uosys, ussys, rosys, rssys}   = estsys(x, y, mod, psys, qsys, bw);

// Restricted b
rb = (ro[1]~rs[1]~rosys[1]~rssys[1]);         

// Restricted t
rt = rb./(ro[2]~rs[2]~rosys[2]~rssys[2]);                       

// Unrestricted b
ub = (uo[.,1]~us[.,1]~uosys[.,1]~ussys[.,1]);                 

// Unrestricted t
ut = ub./(uo[.,2]~us[.,2]~uosys[.,2]~ussys[.,2]);           

/* print options*/
format /m1 /rd 4,3;

print " ";
print " crit =";;
if rule == 1;
    print " sic ";
endif;
if rule == 2;
    print " aic ";
endif;
if rule == 3;
    print " hic ";
endif;
if rule == 4;
    print " pic ";
endif;
if rule == 5;
    print " fic ";
endif;
print " ";
print " restr b/t ";
rb|rt;
print " ";
print " unrestr b/t ";
ub|ut;
print " ";
print " non-system p/q ";
p~q;
print " ";
print " system p/q ";
psys~qsys;
