# Time-Series-Rolling-Forecasting

## Background

The financial departments of large companies often have to make foreign currency transactions when doing international business, while hedge funds are also interested in anything that will provide an edge in predicting currency movements. Hence, both are always eager to gain a better understanding of the future direction and risk of various currencies. 

In this repo I have tested various time series tools in order to predict future movements in the value of the Canadian dollar versus the Japanese yen.

- - -
## Summary of Results

#### ARMA Model

The ARMA model may be a good fit as the p-value for the first AR and MA component, lag 1, are less than 0.05 making it statistically significant. This indicates that there is strong evidence against the null hypothesis, as there is less than a 5% probability the null is correct. However, the model may not a good fit because the p-value for AR.L2 is above 0.05 thus making it statistically insignificant. The ARMA Model results produced a high score in AIC, BIC, and HQIC indicating that this model is not the best fit. Overall the model is most likely not a good fit.

#### ARIMA Model

The p-value for each result in the ARIMA model are all greater than 0.05 thus making the model not a good fit. The AIC, BIC, and HQIC are all also relatively high. 


#### GARCH Model

The GARCH Model is forecasting an increase in price over the next five days. However, the model is not a good fit as the p-value is far greater than 0.05


### Linear Regression Forecasting

#### Regression Analysis 

In-sample Root Mean Squared Error (RMSE): 0.8342483222052092
Out-of-Sample Root Mean Squared Error (RMSE): 0.6445828596930245
    
The higher RMSE result show that the sample data did not fit the model well and needs to be adjusted before it can be helpful. 

---

### Conclusion

Based on the time series anaysis the Yen should not be bought at this time based on the analysis. Although the currency is forecasted to increase, the model results show that the models themselves are not a good fit. There is confidence that these models are not a good fit and should not be used. 

The amount of volatility associated with the Yen may indicate that the currency is too risky to purchase now. Due to models producing conflicting results (i.e. ARMIA suggests that the Yen will decrease whereas the GARCH indicates that the Yen will increase), the Yen may be to risky at the moment to purchase. It is suggested to adjust the models until a good fit is found. 

Based on all the models I would not suggest using them for trading until they have been adjusted to show more promising results. Therefore, the the model performed better with data that it has not been tested on.
