*******************************************************************************************************************
*Emir Yazici
*Nationalism and Human Rights
*2/23/2017
*Do-File
********************************************************************************
******************************DIAGNOSTICS***************************************
********************************************************************************
/*
xtset ccodecow year
xtreg ciri_assn nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtreg ciri_elecsd nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtreg ciri_speech nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtreg ciri_disap nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtreg ciri_kill nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtreg ciri_tort nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtreg ciri_polpris nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum

**********Stationary non-stationary test: no unit root problem******************
xtfisher ciri_assn
xtfisher ciri_elecsd
xtfisher ciri_speech
xtfisher ciri_disap
xtfisher ciri_kill
xtfisher ciri_tort
xtfisher ciri_polpris

********Unit-specific error: There is unit specific error problem.*************
**************************FE Model is suggested*******************************

xtreg ciri_assn nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_assn nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_assn nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore


xtreg ciri_elecsd nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_elecsd nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_elecsd nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore


xtreg ciri_speech nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_speech nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_speech nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore

xtreg ciri_disap nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_disap nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_disap nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore

xtreg ciri_kill nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_kill nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_kill nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore

xtreg ciri_tort nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_tort nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_tort nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore

xtreg ciri_polpris nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xttest0
xtreg ciri_polpris nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
estimates store fixed
xtreg ciri_polpris nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, re
hausman fixed .
hausman fixed ., sigmamore



************************Groupwise Heteroskedasticity****************************
*There is group-wise heteroskedasticty which is fixed through pcse.
xtreg ciri_assn nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3
xtreg ciri_elecsd nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3
xtreg ciri_speech nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3
xtreg ciri_disap nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3
xtreg ciri_kill nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3
xtreg ciri_tort nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3
xtreg ciri_polpris nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum, fe
xttest3

*Theoretically, there is no need to worry about contemporaneous correlation. Also, since the data is unbalanced, it is not testable.

*****************************Autocorrelation************************************
*There is first-order autocorelation. It is fixed in pcse model with c(ar1)

xtserial ciri_assn nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtserial ciri_elecsd nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtserial ciri_speech nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtserial ciri_disap nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtserial ciri_kill nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtserial ciri_tort nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum
xtserial ciri_polpris nat_avg ln_pop ln_GDP p_polity2 Conflict ln_refasylum

*/
********************************************************************************
********************************SUMMARY STATISTICS******************************
********************************************************************************
*Descriptive Statistics
sutex ciri_assn ciri_elecsd ciri_speech ciri_disap ciri_kill ciri_tort ciri_polpris nat_avg ln_pop ln_GDP Conflict p_polity2 ln_refasylum , lab nobs key(descstat) replace file(descstat.tex) title("Summary statistics") minmax

*Sample Table
latabstat year, by(countryname) s(min max) f(%9.2f) 
list countryname year nat_avg 

********************************************************************************
**********************************MODELS****************************************
********************************************************************************
xtset ccodecow year
*** Disggregated Empowerment Rights in Partial Democracies
eststo: xtpcse ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 

*** Disaggregated Physical Integrity Rights in Partial Democracies
eststo: xtpcse ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1)
esttab using Table1_PartialDemocracies.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Partial Democracies"\label{tab1})
eststo clear


*** Disggregated Empowerment Rights in Full Democracies
eststo: xtpcse ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1)
eststo: xtpcse ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 

*** Disaggregated Physical Integrity Rights in Full Democracies
eststo: xtpcse ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
esttab using Table2_FullDemocracies.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Full Democracies"\label{tab1})
eststo clear


********************************************************************************
***************************SUBSTANTIVE EFFECTS GRAPHS**********************************
********************************************************************************
*Nationalism and Freedom of Assembly and Association
xtpcse ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
twoway lfitci ciri_assn nat_avg, ylabel(0(1)2) ytitle(" ""Freedom of Assembly and Association ") /* 
*/xlabel(0(1)9) xtitle(" ""Marginal Effect of Nationalism") graphregion(color(white)) bgcolor(white) scheme(s2mono)

*Nationalism and Freedom of Electoral Self-Determination
xtpcse ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
twoway lfitci ciri_elecsd nat_avg, ylabel(0(1)2) ytitle(" ""Freedom of Electoral Self-Determination ") /* 
*/xlabel(0(1)9) xtitle(" ""Marginal Effect of Nationalism") graphregion(color(white)) bgcolor(white) scheme(s2mono)

*Nationalism and Freedom of Speech
xtpcse ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
twoway lfitci ciri_speech nat_avg, ylabel(0(1)2) ytitle(" ""Freedom of Speech ") /* 
*/xlabel(0(1)9) xtitle(" ""Marginal Effect of Nationalism") graphregion(color(white)) bgcolor(white) scheme(s2mono)

*Nationalism and Political Imprisonment
xtpcse ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
twoway lfitci ciri_polpris nat_avg, ylabel(0(1)8) ytitle(" ""Political Imprisonment ") /* 
*/xlabel(0(1)9) xtitle(" ""Marginal Effect of Nationalism") graphregion(color(white)) bgcolor(white) scheme(s2mono)


********************************************************************************
*****************************ROBUSTNESS TEST*************************************
********************************************************************************

************************1) Generalized Least Square*****************************

*** Disggregated Empowerment Rights in Partial Democracies
eststo: xtgls ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force
eststo: xtgls ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force
eststo: xtgls ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force

*** Disaggregated Physical Integrity Rights in Partial Democracies
eststo: xtgls ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force
eststo: xtgls ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force
eststo: xtgls ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force
eststo: xtgls ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, panels(hetero) corr(psar1) force
esttab using Table3_PartialDemocracies_GLS_.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Partial Democracies"\label{tab1})
eststo clear

*** Disggregated Empowerment Rights in Full Democracies
eststo: xtgls ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force
eststo: xtgls ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force
eststo: xtgls ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force

*** Disaggregated Physical Integrity Rights in Full Democracies
eststo: xtgls ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force
eststo: xtgls ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force
eststo: xtgls ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force
eststo:xtgls ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, panels(hetero) corr(psar1) force
esttab using Table4_FullDemocracies_GLS_.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Full Democracies"\label{tab1})
eststo clear
***********************************2) XTSCC*************************************

*** Disggregated Empowerment Rights in Partial Democracies
eststo: xtscc ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)
eststo: xtscc ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)
eststo: xtscc ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)

*** Disaggregated Physical Integrity Rights in Partial Democracies
eststo: xtscc ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)
eststo: xtscc ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)
eststo: xtscc ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)
eststo: xtscc ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, lag(3)
esttab using Table5_PartialDemocracies_xtscc_.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Partial Democracies"\label{tab1})
eststo clear

*** Disggregated Empowerment Rights in Full Democracies

eststo: xtscc ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)
eststo: xtscc ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)
eststo: xtscc ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)

*** Disaggregated Physical Integrity Rights in Full Democracies

eststo: xtscc ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)
eststo: xtscc ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)
eststo: xtscc ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)
eststo: xtscc ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, lag(3)
esttab using Table6_FullDemocracies_xtscc_.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Full Democracies"\label{tab1})
eststo clear


***********************************3) Coalition Governments*************************************
*** Disggregated Empowerment Rights in Partial Democracies with Coalition Governments
eststo: xtpcse ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1) 

*** Disaggregated Physical Integrity Rights in Partial Democracies with Coalition Governments
eststo: xtpcse ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8 & dpi_nogp>0, p het c(ar1)
esttab using Table7_PartialDemocraciesCoalitionGov.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Partial Democracies with Coalition Governments"\label{tab1})
eststo clear


*** Disggregated Empowerment Rights in Full Democracies with Coalition Governments
eststo: xtpcse ciri_assn nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_elecsd nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1)
eststo: xtpcse ciri_speech nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 

*** Disaggregated Physical Integrity Rights in Full Democracies with Coalition Governments
eststo: xtpcse ciri_disap nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_kill nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_tort nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7 & dpi_nogp>0, p het c(ar1) 
eststo: xtpcse ciri_polpris nat_avg ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7 & dpi_nogp>0, p het c(ar1) 
esttab using Table8_FullDemocraciesCoalitionGov.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Full Democracies with Coalition Governments"\label{tab1})
eststo clear


****************************4) DPI Nationalism Variable*********************************
*** Disggregated Empowerment Rights in Partial Democracies
eststo: xtpcse ciri_assn execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_elecsd execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_speech execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 

*** Disaggregated Physical Integrity Rights in Partial Democracies
eststo: xtpcse ciri_disap execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_kill execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_tort execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1) 
eststo: xtpcse ciri_polpris execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2<8, p het c(ar1)
esttab using Table13_DPIPartialDemocracies.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Partial Democracies (DPI)"\label{tab1})
eststo clear

*** Disggregated Empowerment Rights in Full Democracies
eststo: xtpcse ciri_assn execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_elecsd execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1)
eststo: xtpcse ciri_speech execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 

*** Disaggregated Physical Integrity Rights in Full Democracies
eststo: xtpcse ciri_disap execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_kill execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_tort execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
eststo: xtpcse ciri_polpris execnat ln_pop ln_GDP Conflict ln_refasylum if p_polity2>7, p het c(ar1) 
esttab using Table14_DPIFullDemocracies.tex, b(3) t(a2) label star(* 0.10 ** 0.05 *** 0.001) title("Nationalism and Human Rights in Full Democracies (DPI)"\label{tab1})
eststo clear


