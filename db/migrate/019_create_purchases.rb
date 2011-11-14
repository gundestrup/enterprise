class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.string :name
      t.string :shop
      t.integer :user_id
      t.integer :category_id
      t.integer :ingredience_id
      t.timestamps
    end
      create_table :lists do |t|
          t.integer :purchase_id
          t.integer :ingredience_id
          t.integer :quantity
          t.string :lable
      end
  end

  def self.down
    drop_table :purchases
    drop_table :lists
  end
end
