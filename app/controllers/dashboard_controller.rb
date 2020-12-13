class DashboardController < ApplicationController
  def index
    @drink_with_total = SaleItem.drinks_with_total
    profit_without_accounting_for_discounts = 0
    @net_profit = 0

    SaleItem.includes(:recipe, recipe: [:recipe_items, :recipe_combined_items]).where.not(recipe_id: nil).each do |sale_item|
      profit_without_accounting_for_discounts += sale_item.recipe.sale_price
      @net_profit += sale_item.pos_sum - (sale_item.recipe.total_cost * sale_item.quantity)
    end

    @net_profit = @net_profit.to_i
    @discounts_given = (profit_without_accounting_for_discounts - @net_profit).to_i
    @gross_sales_removing_discounts = profit_without_accounting_for_discounts.to_i
    @unaccounted_for_sales = SaleItem.where(recipe_id: nil).sum(:pos_sum).to_i
    @total_sales = Sale.sum(:pos_total).to_i

    @product_profit_margin = @net_profit / @total_sales.to_f

    @stats = {
      last_7_days: {
        sales_per_day: Sale.amount_in_last_days(7).to_i / 7,
        average_sale_value: Sale.where('pos_datetime > ?', 7.days.ago).average(:pos_total).to_i,
        average_items_sold:  SaleItem.joins(:sale).where('pos_datetime > ?', 7.days.ago).sum(:quantity) / 7,
        most_drinks_sold: SaleItem.joins(:sale).group_by_day(:pos_datetime).where('pos_datetime > ?', 7.days.ago).count(:name).values.max,
      },
      last_30_days: {
        sales_per_day: Sale.amount_in_last_days(30).to_i / 30,
        average_sale_value: Sale.where('pos_datetime > ?', 30.days.ago).average(:pos_total).to_i,
        average_items_sold:  SaleItem.joins(:sale).where('pos_datetime > ?', 30.days.ago).sum(:quantity) / 30,
        most_drinks_sold: SaleItem.joins(:sale).group_by_day(:pos_datetime).where('pos_datetime > ?', 30.days.ago).count(:name).values.max,
      },
      overall: {
        sales_per_day: (Sale.sum(:pos_total) / Sale.day_count).to_i,
        average_sale_value: Sale.average(:pos_total).to_i,
        average_items_sold:  SaleItem.joins(:sale).where('pos_datetime > ?', 10000.days.ago).sum(:quantity) / Sale.day_count,
        most_drinks_sold: SaleItem.joins(:sale).group_by_day(:pos_datetime).count(:name).values.max
      }
    }

    @totals = {
      items_sold: SaleItem.sum(:quantity)
    }

    @goals = {
      break_even_daily_sales: (Recurring.sum(:cost) / 30 * (1 + @product_profit_margin)).to_i
    }
  end
end
