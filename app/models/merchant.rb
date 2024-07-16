class Merchant
  attr_reader :id, :iban, :discount, :transactions, :amount_sum, :fee_sum

  def initialize(merchant)
    @id = merchant
    data
  end

  def data
    response = JSON.parse(Net::HTTP.get(uri))
    @iban = response['iban']
    @discount = response['discount']
    @transactions = response['transactions']
    @amount_sum = 0
    @fee_sum = 0
    @transactions.each do |transaction|
      @amount_sum += transaction['amount']
      @fee_sum += transaction['fee']
    end
  end

  def payable
    if @discount['minimum_transaction_count'] >= @transactions.count
      @amount_sum - (@fee_sum * (@discount['fees_discount'] / 100))
    end

    @amount_sum - @fee_sum
  end

  def uri
    URI("https://simpledebit.gocardless.io/merchants/#{@id}")
  end
end
