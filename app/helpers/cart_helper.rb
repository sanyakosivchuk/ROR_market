module CartHelper
  def total_price
    total_price = 0
    @cart.orderables.each do |orderable|
      total_price += orderable.total
    end
    total_price
  end
end
