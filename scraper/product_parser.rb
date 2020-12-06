class ProductParser
  PRODUCT_NAME_REGEXP = /(.*(?= \d x))/
  PRODUCT_DISCOUNT_REGEXP = /([0-9]+%)/
  PRODUCT_QUANTITY_REGEXP = /([0-9]+(?= x))/
  PRODUCT_TOTAL_COST_REGEXP = /([0-9]+\.[0-9]+$)/

  def self.parse(product_rows)
    product_rows.map do |product_text|
      item = {}
      item[:name] = product_text[PRODUCT_NAME_REGEXP]
      raise "Name is probably wrong: #{item[:name]} with count of #{item[:name].length}" if item[:name].length < 18

      found_discount = product_text[PRODUCT_DISCOUNT_REGEXP]
      item[:discount] = found_discount ? found_discount.to_f / 100 : nil
      item[:quantity] = product_text[PRODUCT_QUANTITY_REGEXP].to_i
      item[:total_cost] = product_text[PRODUCT_TOTAL_COST_REGEXP].to_f
      item
    end.select { |p| p[:name] }
  end
end
