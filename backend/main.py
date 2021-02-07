import csv
import pandas as pd
# generate related variables
from numpy import mean
from numpy import std
from numpy.random import randn
from numpy.random import seed
from matplotlib import pyplot

STOCK = 'SPY.csv'
COVID_US_DATA = 'national-history.csv'

# seed random number generator
# seed(1)
# prepare data
# data1 = 20 * randn(1000) + 100
# data2 = data1 + (10 * randn(1000) + 50)
# print(type(data1))
# summarize
# print('data1: mean=%.3f stdv=%.3f' % (mean(data1), std(data1)))
# print('data2: mean=%.3f stdv=%.3f' % (mean(data2), std(data2)))
# plot
#pyplot.scatter(data1, data2)
#pyplot.show()
print('stock covid analysis')


# spy_close = {}
# new_cases = {}

# with open(STOCK) as csvfile:
# 	reader = csv.DictReader(csvfile)
# 	for row in reader:
# 		#print(row)
# 		date = row['Date']
# 		spy_close[date] = row['Close']

# with open(COVID_US_DATA) as csv_covid:
# 	reader = csv.DictReader(csv_covid)
# 	for row in reader:
# 		#print(row)
# 		date = row['date']
# 		new_cases[date] = row['positiveIncrease']


def score():
	df=pd.read_csv(STOCK, sep=',',header=0)
	ticker = STOCK[:-4]
	print(ticker)
	df2=pd.read_csv(COVID_US_DATA, sep=',', header=0)
	cleaned_covid = df2[df2.date.isin(df.Date)]
	#print(cleaned_covid)
	active_cases = cleaned_covid.positiveIncrease
	df.Close=df.Close[::-1]
	close_prices = df.Close
	correlation = close_prices.corr(active_cases, method='pearson')
	print(f"Correlation between stock and cases is {correlation}")
	return {"TICKER":ticker ,"COVID SCORE": correlation}
score()
refs = ['https://covidtracking.com/data/download','https://finance.yahoo.com/quote/SPY/history/']
