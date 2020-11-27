class ProductParser
  # the product modal doesn't have html structure that makes it easy to pull data out of it
  # and there's a bunch of extra un-nessary tds scattered around. This is a bit fragile to their
  # changes, but this is what we have for now.
  EXTRA_BEGINNING_ROWS_IN_UI = 2
  EXTRA_ENDING_ROWS_IN_UI = 6

  PRODUCT_NAME_REGEXP = /(.*(?= \d x))/
  PRODUCT_DISCOUNT_REGEXP = /([0-9]+%)/
  PRODUCT_QUANTITY_REGEXP = /([0-9]+(?= x))/
  PRODUCT_TOTAL_COST_REGEXP = /([0-9]+\.[0-9]+$)/

  def self.parse(product_rows)
    extra_beginning_rows = 2
    extra_ending_rows = 6
    product_line_texts = product_rows[extra_beginning_rows...(product_rows.length - extra_ending_rows)].map(&:text).map(&:downcase)

    product_line_texts.map do |product_text|
      item = {}
      item[:name] = product_text[PRODUCT_NAME_REGEXP]
      found_discount = product_text[PRODUCT_DISCOUNT_REGEXP]
      item[:discount] = found_discount ? found_discount.to_f / 100 : nil
      item[:quantity] = product_text[PRODUCT_QUANTITY_REGEXP].to_i
      item[:total_cost] = product_text[PRODUCT_TOTAL_COST_REGEXP].to_f
      item
    end
  end
end
