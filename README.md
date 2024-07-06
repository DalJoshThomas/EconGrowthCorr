# Impact of corruption on Economic Growth
**Executive Summary** : This study is driven by the signicant debate surrounding whether corruption harms or promotes economic growth. With this controversy in mind, the research delves
into the relationship between corruption and economic growth in Jamaica for the time period 1990 to 2017. Through the use of a Autoregressive Distributed Lag
(ARDL) and the Dynamic Autoregressive Distributed Lag (DARDL) model with an error correction component, we were able to capture both the short-term and
long-term impacts of corruption on economic growth, which provides a more comprehensive understanding of the dynamic relationship between these variables. Unlike
other studies that often generalize their ndings to a global or regional context, our research is uniquely tailored to the socio-economic and political nuances of
Jamaica. Findings point to a signicant and negative relationship between corruption and economic growth, indicating that higher levels of corruption are associated
with lower economic growth rates. A one-unit increase in the corruption index corresponds to a contemporaneous decrease in economic growth by 2.9% in the ARDL
model. In the DARDL model, we observed that a 1 standard deviation shock to the corruption variable leads to a decrease of 68% in the lagged period in economic
growth. The ndings suggest that reducing corruption could lead to improvements in economic performance. Jamaica's government could direct more funding towards
anti-corruption agencies to alleviate corruption, oer extra protection for whistleblowers, and conduct corruption awareness campaigns.

![EconGrowthCorrup](https://github.com/DalJoshThomas/EconGrowthCorr/blob/main/EconCorrupGrow.png)

**Data** : The data for this project was sourced from the IMF, World Bank and International Country Risk Guide.

**Methodology** : After examining the scatterplots, a non-linear relationship was revealed among the selected variables, underscoring the
necessity for employing a non-linear econometric framework. In this study, the ARDL and DARDL techniques were used, known for their  exible and dynamic attributes, enabling the modeling
of symmetries in dynamic adjustment patterns and basic long-run associations simultaneously (Bayramoglu and Yildirim, 2017). This approach is crucial in economic modeling, where linear
relationships may inadequately capture the complexities of real-world phenomena. Moreover, Zangina and Hassan (2020) emphasized the appropriateness of the DARDL technique
in addressing dynamic research issues due to its capacity to estimate asymmetries in both short and long-run data while identifying hidden cointegration. DARDL models are adept at
handling endogeneity issues common in economic data by incorporating lagged variables and error correction terms to account for feedback effects and endogenous relationships among variables. One of its notable features is its allowance for bidirectional causality between variables, unlike many traditional models that assume unidirectional causality. Additionally, the bounds cointegration approach can be applied regardless of whether the variables are integrated of the same order or not. This method is applicable even if regressors are integrated of the same order or mixed, provided they are not I(2) (Shin et al., 2014; Jalil, Tariq, and Bibi, 2014). The simplicity of the model makes it an appropriate framework for modeling complex issues (Shin et al., 2014). The Error Correction Model (ECM) serves as a valuable tool in ARDL research due to its ability to capture both short-term dynamics and long-term equilibrium relationships among economic variables. By incorporating the error correction term, ECM allows for the examination of how variables adjust back to their long-run equilibrium following short-term shocks or deviations. This dynamic adjustment mechanism is crucial in understanding the speed and pattern of adjustments within economic systems, providing insights into the responsiveness of variables to changes in the short run while maintaining their equilibrium positions in the long run. Additionally, ECM is well-suited for modeling cointegrated variables, which often characterize economic relationships that exhibit long-term stability despite short-term fluctuations. This capability is
essential for analyzing the interplay between variables with shared long-run trend.

**Skills** : Data Analysis in STATA, Time Series Analysis in STATA
