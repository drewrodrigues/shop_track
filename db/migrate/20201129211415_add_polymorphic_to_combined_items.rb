class AddPolymorphicToCombinedItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :combined_items, :itemable, polymorphic: :true
  end
end
