class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :stock
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
