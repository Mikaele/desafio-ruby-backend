class CreateTypeTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :type_transactions do |t|
      t.string :description, :limit=> 30, null: false
      t.string :kind, :limit=> 10,  null: false
      t.string :sign, :limit=> 1, null: false
    end
  end
end
