class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :type_transaction, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :archive, null: false, foreign_key: true
      t.float :value,  null: false
      t.string :card, null: false
      t.time :event_date, null: false

      t.timestamps
    end
  end
end
