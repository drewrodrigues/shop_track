class DashboardController < ApplicationController
  def index
    @drink_with_total = SaleItem.drinks_with_total
    profit_without_accounting_for_discounts = 0
    @net_profit = 0

    SaleItem.includes(:recipe, recipe: [:recipe_items, :recipe_combined_items]).where.not(recipe_id: nil).each do |sale_item|
      profit_without_accounting_for_discounts += sale_item.recipe.sale_price
      @net_profit += sale_item.pos_sum - sale_item.recipe.total_cost
    end

    @net_profit = @net_profit.to_i
    @discounts_given = (profit_without_accounting_for_discounts - @net_profit).to_i
    @gross_sales_removing_discounts = profit_without_accounting_for_discounts.to_i
    @unaccounted_for_sales = SaleItem.where(recipe_id: nil).sum(:pos_sum).to_i
    @total_sales = SaleItem.sum(:pos_sum).to_i

    @stats = {
      last_7_days: {
        sales_per_day: Sale.amount_in_last_days(7).to_i / 7,
        average_sale_value: Sale.where('pos_datetime > ?', 7.days.ago).average(:pos_total).to_i,
        avg_drinks_sold_per_day: SaleItem.average_per_day_in_last_days(7),
        average_items_sold:  SaleItem.joins(:sale).where('pos_datetime > ?', 7.days.ago).sum(:quantity) / 7,
        most_drinks_sold: SaleItem.joins(:sale).group_by_day(:pos_datetime).where('pos_datetime > ?', 7.days.ago).count(:name).values.max,
      },
      last_30_days: {
        sales_per_day: Sale.amount_in_last_days(30).to_i / 30,
        average_sale_value: Sale.where('pos_datetime > ?', 30.days.ago).average(:pos_total).to_i,
        avg_drinks_sold_per_day: SaleItem.average_per_day_in_last_days(30),
        average_items_sold:  SaleItem.joins(:sale).where('pos_datetime > ?', 30.days.ago).sum(:quantity) / 30,
        most_drinks_sold: SaleItem.joins(:sale).group_by_day(:pos_datetime).where('pos_datetime > ?', 30.days.ago).count(:name).values.max,
      },
      overall: {
        sales_per_day: (Sale.sum(:pos_total) / Sale.day_count).to_i,
        average_sale_value: Sale.average(:pos_total).to_i,
        avg_drinks_sold_per_day: SaleItem.average_per_day_in_last_days(10000) / Sale.day_count,
        average_items_sold:  SaleItem.joins(:sale).where('pos_datetime > ?', 10000.days.ago).sum(:quantity) / Sale.day_count,
        most_drinks_sold: SaleItem.joins(:sale).group_by_day(:pos_datetime).count(:name).values.max
      }
    }
  end
end
