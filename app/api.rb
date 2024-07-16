require 'uri'
require 'net/http'
require 'json'
require './models/merchant'

class ApiTest
  def merchants
    uri = URI('https://simpledebit.gocardless.io/merchants')
    response = JSON.parse(Net::HTTP.get(uri))
    merchants = response.map { |merchant| Merchant.new(merchant) }
    pp merchants[0].uri
    # test.each { |element| pp element }
  end
end

ApiTest.new.merchants
