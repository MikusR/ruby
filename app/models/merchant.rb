class Merchant
  attr_accessor :id

  def initialize(merchant)
    @id = merchant
  end

  def uri
    URI("https://simpledebit.gocardless.io/merchants/#{@id}")
  end
end
