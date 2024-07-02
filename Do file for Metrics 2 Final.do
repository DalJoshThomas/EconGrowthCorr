// Check dataset contents including the summary statistic
describe
summarize

// Initializing dataset as time series
tsset Year

//Logging GDP to make it more normally distributed
generate loggdp = log( GDP_ConLCU )


// Creating scatter plots with best fit line of each variable on GDP
scatter loggdp Corruption || lfit log_GDP Corruption
scatter loggdp GovExpenditure || lfit log_GDP GovExpenditure
scatter loggdp GovernmentStability || lfit log_GDP GovernmentStability
scatter loggdp LabForceTotal || lfit log_GDP LabForceTotal
scatter loggdp TaxRevenue || lfit log_GDP TaxRevenue

//Generate time series plots
tsline loggdp 
tsline Corruption
tsline GovExpenditure 
tsline GovernmentStability
tsline LabForceTotal 
tsline TaxRevenue

//To generate the correlation matrix
corr  GovernmentStability Corruption loggdp GovExpenditure LabForceTotal TaxRevenue


// Create a list of variables to test for stationarity
local varlist "GovernmentStability Corruption loggdp GovExpenditure LabForceTotal TaxRevenue"


// Loop through variables and run ADF tests
foreach var of local varlist {
    dfuller `var'
    pperron `var'
}

// The list of non stationary variables are
local varnostationary "GovernmentStability Corruption loggdp GovExpenditure LabForceTotal TaxRevenue"


// Generate first differences for the variables
foreach var of local varlist {
    gen diff_`var' = D.`var'
}

//Created a list of first differences variables
local varstationary diff_GS diff_Corup diff_LabForce diff_TaxR diff_GE diff_loggdp

foreach var of local varstationary{
dfuller `var'
pperron `var'
}
// The variables are I(1)

//To determine the optimal lag length for each variable
foreach var of local varstationary{
varsoc `var'
}
 
// To run the ARDL model based on the results
ardl diff_LogGDP diff_GS diff_Corup diff_LabForce diff_TaxR diff_GE , lags(1,0,0,0,3,0)
 
 
//To test for autocorrelation
 estat dwatson
 
//To test for heteroskedasticity
 estat imtest, white
 
//To test for normality of residuals
 predict resid,residuals
 swilk resid

estat sbcusum

// Running the model incrementally


//Model 1
ardl diff_LogGDP diff_Corup , lags(1,0)
//To test for autocorrelation
 estat dwatson
 
//To test for heteroskedasticity
 estat imtest, white
 
//To test for normality of residuals
 predict resid1,residuals
 swilk resid1

estat sbcusum

//Model 2
ardl diff_LogGDP diff_Corup diff_GE , lags(1,0,0)
//To test for autocorrelation
 estat dwatson
 
//To test for heteroskedasticity
 estat imtest, white
 
//To test for normality of residuals
 predict resid2,residuals
 swilk resid2

estat sbcusum

//Model 3
ardl diff_LogGDP diff_Corup diff_GE diff_GS , lags(1,0,0,0)
//To test for autocorrelation
 estat dwatson
 
//To test for heteroskedasticity
 estat imtest, white
 
//To test for normality of residuals
 predict resid3,residuals
 swilk resid3
 
estat sbcusum

//Model 4
ardl diff_LogGDP diff_Corup diff_GE diff_LabForce diff_GS ,lags(1,0,0,0,0)
//To test for autocorrelation
 estat dwatson
 
//To test for heteroskedasticity
 estat imtest, white
 
//To test for normality of residuals
 predict resid4,residuals
 swilk resid4

 estat sbcusum
 
///To test for Cointegration in all models

//To test for Cointegration in Model 1
varsoc GDP_ConLCU
varsoc Corruption 
ardl GDP_ConLCU Corruption, lags (2,2) ec
estat ectest

//To test for cointegration in Model 2
varsoc GDP_ConLCU
varsoc Corruption
varsoc GovernmentStability 
ardl GDP_ConLCU Corruption GovernmentStability, lags (2,2,1) ec
estat ectest

//To test for Cointegration in Model 3
varsoc GovExpenditure
varsoc GDP_ConLCU
varsoc Corruption
varsoc GovernmentStability
ardl GDP_ConLCU Corruption GovernmentStability GovExpenditure, lags (2,2,1,1) ec
estat ectest

//To test for cointegration in Model 4
varsoc GovExpenditure
varsoc GDP_ConLCU
varsoc Corruption
varsoc GovernmentStability
varsoc LabForceTotal
ardl GDP_ConLCU Corruption GovernmentStability GovExpenditure LabForceTotal , lags (2,2,1,1,1) ec
estat ectest


//To test for cointegration in Model 5
varsoc GovExpenditure
varsoc GDP_ConLCU
varsoc Corruption
varsoc GovernmentStability
varsoc LabForceTotal
varsoc TaxRevenue
ardl GDP_ConLCU Corruption GovernmentStability GovExpenditure LabForceTotal TaxRevenue , lags (2,2,1,1,1,4) ec
estat ectest
 
//We prepare to run the error correction model by finding the optimal lag lengths for each of the variables
local varforec logGDP GovernmentStability Corruption LabForceTotal TaxRevenue GovExpenditure
 
 foreach var of local varforec{
  varsoc `var'
 }


//To run the dynamic ARDL model
dynardl diff_LogGDP diff_Corup diff_TaxR diff_GS diff_LabForce diff_GE, lags(1,.,1/3,.,.,.) shockvar(diff_Corup) shockval(+1) time(5) range(24) ec graph

//To test for autocorrelation
 estat dwatson
 
//To test for heteroskedasticity
 estat imtest, white
 
//To test for normality of residuals
 predict residn,residuals
 swilk residn

estat sbcusum