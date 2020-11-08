class CreateKitchenItems < ActiveRecord::Migration[6.0]
  def change
    create_table :kitchen_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
