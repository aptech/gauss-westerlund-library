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

// Max factors
kmax = 5;

// Criterion
cri  = 2;

// Penalty
pen  = 2;

// Bandwidth
p    = int(4*(t/100)^(2/9));

// Call panel test
{ dhg, dgp } = gdh_panel(y, x, kmax, pen, cri, mu_g, mu_p, var_g, var_p);

/* printing options */
format/m1/rd 8,3;

print " ";
print " dh_g = ";;
dhg;
print " dh_p = ";;
dhp;


