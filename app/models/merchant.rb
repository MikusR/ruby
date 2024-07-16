class Merchant
  def initialize(merchant)
    @merchant.name = merchant
  end

  def uri
    "https://simpledebit.gocardless.io/merchants/#{@merchant}"
  end
end
