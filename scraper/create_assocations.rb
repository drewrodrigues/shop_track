require_relative '../config/environment'

class CreateAssociations
  attr_reader :logger

  def initialize
    @logger = Logger.new('scraper.log', 'daily')
    unassociated_sale_items = SaleItem.where(recipe_id: nil)
    unassociated_sale_items.each {|sale_item| match_item(sale_item)}
  end

  def match_item(sale_item)
    recipe_to_associate = recipes.find do |recipe|
      sale_item.name.downcase.include?(recipe.scraper_sale_text_association.downcase)
    end

    if recipe_to_associate
      puts "Found an association"
      sale_item.recipe = recipe_to_associate
      sale_item.save!
    else
      puts "Didn't find recipe to associate: #{sale_item.name}"
    end
  end

  private

  def recipes
    @recipes ||= Recipe.where.not(scraper_sale_text_association: nil)
  end
end

CreateAssociations.new
