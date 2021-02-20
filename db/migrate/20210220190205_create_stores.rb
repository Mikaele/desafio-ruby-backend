class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :owner, null: false
      t.string :cpf, null: false , :limit => 11

      t.timestamps
    end
  end
end
