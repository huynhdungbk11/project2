module Admin::ProductsHelper
  def total_price_product cart
    number_to_currency(cart.total_price, unit: t("product_vnd"),
      delimiter: Settings.currency.delimiter,
      format: Settings.currency.format,
      precision: Settings.currency.precision)
  end
end


