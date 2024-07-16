require 'uri'
require 'net/http'
require 'json'
require './models/merchant'

class ApiTest
  def merchants
    uri = URI('https://simpledebit.gocardless.io/merchants')
    response = JSON.parse(Net::HTTP.get(uri))
    pp Merchant.new(response[0]).transactions
    # response.map { |merchant| Merchant.new(merchant) }
  end

  def transactions(merchant)
    uri = merchant.uri
    JSON.parse(Net::HTTP.get(uri))
  end
end

app = ApiTest.new
merchants = app.merchants
# pp merchants[0].uri
# pp app.transactions(merchants[0])
