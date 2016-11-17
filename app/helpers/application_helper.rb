module ApplicationHelper
  def increase_one index
    index + Settings.index.suggestion
  end

  def condition_show index
    (index+Settings.condition.index_default) == Settings.condition.index_one or
    (index+Settings.condition.index_default) == Settings.condition.index_tow or
    (index+Settings.condition.index_default) == Settings.condition.index_fine or
    (index+Settings.condition.index_default) == Settings.condition.index_six
  end

  def product_price item
    number_to_currency(item, unit: t("product_vnd"),
      delimiter: Settings.currency.delimiter,
      format: Settings.currency.format,
      precision: Settings.currency.precision)
  end

  def check_name object
    object.nil? ? "" : object.name
  end

  def check_description object
    object.nil? ? "" : object.description
  end

  def check_price object
    object.nil? ? "" : object.price
  end

  def check_image object
    object.nil? ? "" : object.image
  end

  def check_suggestion object
    object.nil?
  end

  def total_price_order item
    item.number * item.product.price
  end
end
