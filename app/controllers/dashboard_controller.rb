class DashboardController < ApplicationController
  def index
    @drink_with_total = SaleItem.drinks_with_total
    profit_without_account_for_discounts = 0
    @net_profit = 0
    SaleItem.joins(:recipe).where.not(recipe_id: nil).each do |sale_item|
      profit_without_account_for_discounts += sale_item.recipe.sale_price
      @net_profit += sale_item.pos_sum - sale_item.recipe.total_cost
    end
    @discounts_given = profit_without_account_for_discounts - @net_profit
  end
end
