*** Nationalism and Human Rights in Turkey (1999-2016)

**Standardize the variables

*sum NationalismScore totalhr
*gen znat=( NationalismScore--.2868722)/.1425783
*gen zhr=(totalhr-3.833333)/1.043185

**Create the Time-Series Graph
tsset Year
tsline zhr znat

tsline zhr znat, tline(2006 2013) tline(2013 2016) graphregion(color(white)) bgcolor(white) scheme(s2mono)

