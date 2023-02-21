class CreateSubscription < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.float :price
      t.boolean :status
      t.integer :frequency
      t.references :tea, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
    end
  end
end
