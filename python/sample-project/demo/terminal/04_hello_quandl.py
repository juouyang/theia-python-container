import quandl
quandl.ApiConfig.api_key = 'xti1h_ei-7KweXvgU5VH' # Get your access key from https://www.quandl.com
data = quandl.get('NSE/OIL')
print(data.head())
data = quandl.get_table('ZACKS/FC', ticker='AAPL')
print(data.head())
