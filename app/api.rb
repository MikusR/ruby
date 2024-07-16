require 'uri'
require 'net/http'
require 'json'
require './models/merchant'

class ApiTest
  def merchants
    uri = URI('https://simpledebit.gocardless.io/merchants')
    response = JSON.parse(Net::HTTP.get(uri))
    # pp Merchant.new(response[0]).payable
    response.map { |merchant| Merchant.new(merchant) }
  end

  def write_csv
    to = merchants
    pp to[0].payable
  end
end

app = ApiTest.new
app.write_csv
