class Merchant
  attr_accessor :id, :iban, :discount, :transactions

  def initialize(merchant)
    @id = merchant
    response = JSON.parse(Net::HTTP.get(uri))
    @iban = response['iban']
    @discount = response['discount']
    @transactions = response['transactions']
  end

  def uri
    URI("https://simpledebit.gocardless.io/merchants/#{@id}")
  end
end
