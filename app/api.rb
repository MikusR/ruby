require 'uri'
require 'net/http'
require 'json'
require './models/merchant'

class ApiTest
  def merchants
    uri = URI('https://simpledebit.gocardless.io/merchants')
    response = JSON.parse(Net::HTTP.get(uri))
    pp Merchant.new(response[0]).payable
    # response.map { |merchant| Merchant.new(merchant) }
  end

  def write_csv
  end
end

app = ApiTest.new
merchants = app.merchants
# pp merchants[0].uri
# pp app.transactions(merchants[0])
