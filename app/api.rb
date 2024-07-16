require 'uri'
require 'net/http'
require 'json'

class ApiTest
  def merchants
    uri = URI('https://simpledebit.gocardless.io/merchants')
    merchants = JSON.parse(Net::HTTP.get(uri))
    merchants.each {|merchant| }
    pp merchants[0]
    # test.each { |element| pp element }
  end
end

ApiTest.new.merchants
