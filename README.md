# Time-Series-Rolling-Forecasting

## Preliminary Remarks

Financial divisions within large enterprises frequently execute transactions in foreign currencies in the course of international business operations. Similarly, hedge funds are always in the hunt for strategies to gain a competitive edge in predicting currency fluctuations. As a consequence, both these parties are perpetually striving to acquire superior comprehension of the prospective trends and risks associated with diverse currencies.

In this repository, I have employed various time series instruments to envisage future fluctuations in the exchange rate of the Canadian dollar vis-a-vis the Japanese yen.

- - -
## Synopsis of Findings
#### Autoregressive Moving Average (ARMA) Model

The ARMA model seems to be a plausible fit, given the p-value for the primary AR and MA components (lag 1) are less than 0.05, signifying statistical significance. This suggests compelling evidence against the null hypothesis, with less than a 5% probability of the null hypothesis being correct. However, the ARMA model may not be appropriate since the p-value for AR.L2 surpasses 0.05, indicating statistical insignificance. The ARMA model results disclosed high scores in AIC, BIC, and HQIC, which signifies that this model may not be the best fit. In sum, the model is likely not an adequate fit.

The p-value for each result in the ARIMA model are all greater than 0.05 thus making the model not a good fit. The AIC, BIC, and HQIC are all also relatively high. 

#### Autoregressive Integrated Moving Average (ARIMA) Model

The p-values for each output in the ARIMA model surpass 0.05, suggesting the model is not an adequate fit. The AIC, BIC, and HQIC values are also notably high.

#### Generalized Autoregressive Conditional Heteroskedasticity (GARCH) Model

The GARCH model forecasts a surge in price over the forthcoming five days. Nonetheless, the model is not a satisfactory fit as the p-value is considerably greater than 0.05.


### Linear Regression Forecasting

#### Regression Analysis 

In-sample Root Mean Squared Error (RMSE): 0.8342483222052092
Out-of-Sample Root Mean Squared Error (RMSE): 0.6445828596930245

The elevated RMSE values indicate that the sample data did not align well with the model and require adjustments before yielding beneficial insights.

---

### Deductions

Drawing on the time series analysis, it is advised not to purchase yen at this juncture, despite the currency being forecasted to appreciate. The model results imply that the models are not sufficiently accurate. There is confidence that these models are inadequate and should not be utilized in their current state.

The observed volatility associated with the yen could indicate that the currency poses an excessively high risk for acquisition at present. Considering the models produce discordant predictions (i.e., the ARIMA model suggests a decrease in yen value, while the GARCH model predicts an increase), the yen might currently pose too high of a risk for procurement. It is recommended to fine-tune the models until an adequate fit is attained.

Considering all the models, I would advise against deploying them for trading purposes until they have been refined to produce more encouraging results. Hence, the model demonstrated superior performance with data it has not been previously tested on.
