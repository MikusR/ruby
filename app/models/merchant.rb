class Merchant
  attr_accessor :name

  def initialize(merchant)
    @name = merchant
  end

  def uri
    URI("https://simpledebit.gocardless.io/merchants/#{@name}")
  end
end
