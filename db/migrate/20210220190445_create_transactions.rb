class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :type_transaction_id, null: false
      t.integer :store_id ,null: false
      t.integer :archive_id, null: false
      t.float :value, null: false
      t.string :card, null: false
      t.date :event_date, null: false
      t.time :event_time, null: false

      t.timestamps
    end

    add_index :transactions, [:type_transaction_id, :store_id, :value, :value, :event_date, :event_time], name: 'uniq_transaction_store_value_card_date',unique: true

  end
end
