require 'uri'
require 'net/http'
require 'json'
require './models/merchant'

class ApiTest
  def merchants
    uri = URI('https://simpledebit.gocardless.io/merchants')
    response = JSON.parse(Net::HTTP.get(uri))
    response.map { |merchant| Merchant.new(merchant) }
  end

  def transactions(merchant)
    uri = merchant.uri
    response = JSON.parse(Net::HTTP.get(uri))
    pp response
  end
end

app = ApiTest.new
merchants = app.merchants
pp app.transactions(merchants[0])
