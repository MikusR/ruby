class Merchant
  attr_reader :id, :iban, :discount, :transactions, :amount_sum, :fee_sum

  def initialize(merchant)
    @id = merchant
    response = JSON.parse(Net::HTTP.get(uri))
    @iban = response['iban']
    @discount = response['discount']
    @transactions = response['transactions']
    @amount_sum = 0
    @fee_sum = 0
    @transactions.each do |transaction|
      amount_sum += transaction['amount']
      fee_sum += transaction['fee']
    end
  end

  def uri
    URI("https://simpledebit.gocardless.io/merchants/#{@id}")
  end
end
