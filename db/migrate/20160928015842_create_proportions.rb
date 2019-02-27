class CreateProportions < ActiveRecord::Migration[5.0]
  def change
    create_table :proportions do |t|
      t.string :amount
      t.references :cocktail, foreign_key: true, on_delete: :cascade
      t.references :ingredient, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
