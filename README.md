
# SentimentStocks
SentimentStocks is a Flutter application (currently released [on the web](https://sentiment-stocks.web.app/)) that performs sentiment analysis on news articles and combines this data with COVID-19 case information to create a custom recommendation for which stocks may be on the rise in the near future.

# Problem

COVID-19 has brought many more recreational investors to the stock market. As a result, sentiment on a stock has a greater affect than ever and old methods of analysing stocks could one day be irrelevant in this changing world. This also means that social media is more influential than ever in terms of how people interact and how stock markets will behave. We wanted to find a way that we can capitalize on this shift in the market.

# Solution

Our solution is a simple easy to use app that allows users to track stocks based on 2 metrics. Covid Score and Sentiment Score. These scores are used in our algorithym to give our recommendation of whether you should buy or sell a stock at the current price.

## Info Popup

![HelpPopupScreenshot](https://user-images.githubusercontent.com/59609232/107149259-9cc82180-6925-11eb-88fe-df06511b9649.png)

# Tech Stack

- **Python** backend to run natural language processing on news articles as well as analysis of COVID-19 data in order to generate Sentiment and COVID scores for delivery to the frontend
- **Flutter** frontend to display various tickers and their Sentiment and COVID scores
- Hosted on **Google Firebase**

