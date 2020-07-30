new;
library westerlundlib;


// Here we load all data for testing
// Note that this dataset is stacked
// and the durbinh_panel procedure
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

// Information criteria rule
// 1 = SIC
// 2 = AIC
// 3 = HIQ
// 4 = PIC
// 5 = FIC
rule = 2;              

// Model specification
// 1 = Nothing
// 2 = Constant
// 3 = Constant & Trend
mod = 1;               

// Max lag
pmax = 2;               

// Max lead
qmax = 2;              

// Bandwidth
bw = int(t^(1/3));	   

/* non-syst est */
//  Lags and leads
{ p, q } = ic(x, y, pmax, qmax, mod, rule);    

// Unrestricted dols b, t
// Unrestricted dsur b & t
// Restricted dols b & t
// Restricted dsur b & t
{ uo, us, ro, rs } = est(x ,y, mod, p, q, bw);        

// System estimation
{ psys, qsys } = icsys(x, y, pmax, qmax, mod, rule);
{ uosys, ussys, rosys, rssys} = estsys(x, y, mod, psys, qsys, bw);

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
