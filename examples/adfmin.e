new;
library westerlundlib;

//**********************************************************
// Start reading your data
//**********************************************************

// Here we load all data for testing
// Note that this dataset is stacked
// and the adfmin_west procedure
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

// No break and constant only
{sz_t, sz_rho, pz_t, pz_rho} = adfmin_west(y, x);

