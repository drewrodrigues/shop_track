class AssociateTextWithScrapedRecordsOnRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :scraper_sale_text_association, :string
  end
end
