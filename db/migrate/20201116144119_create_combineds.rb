class CreateCombineds < ActiveRecord::Migration[6.0]
  def change
    create_table :combineds do |t|
      t.string :name

      t.timestamps
    end
  end
end
