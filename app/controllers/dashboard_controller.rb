class DashboardController < ApplicationController
  def index
    @drink_with_total = SaleItem.drinks_with_total
    @net_profit = 0
    SaleItem.joins(:recipe).where.not(recipe_id: nil).each do |sale_item|
      @net_profit += sale_item.recipe.profit
    end
  end
end
