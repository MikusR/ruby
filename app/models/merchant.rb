class Merchant
  def initialize(merchant)
    @merchant = merchant
  end

  def uri
    URI("https://simpledebit.gocardless.io/merchants/#{@merchant}")
  end
end
