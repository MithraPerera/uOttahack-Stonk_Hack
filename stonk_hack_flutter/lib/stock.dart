class Stock {
  String ticker;
  double price;
  double covidScore;
  double sentimentScore;
  String buySell;

  Stock (this.ticker, this.price, this.covidScore, this.sentimentScore);

  Stock.fromJson(Map<String, dynamic> json)
    : ticker = json['ticker'],
      price = json['price'],
      covidScore = json['covidScore'],
      sentimentScore = json['sentimentScore'],
      buySell = json['buySell'];
}