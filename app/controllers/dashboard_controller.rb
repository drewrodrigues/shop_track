class DashboardController < ApplicationController
  def index
    @drink_with_total = SaleItem.drinks_with_total
  end
end
