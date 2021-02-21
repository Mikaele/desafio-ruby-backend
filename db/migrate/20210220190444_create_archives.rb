class CreateArchives < ActiveRecord::Migration[6.1]
  def change
    create_table :archives do |t|
      t.string :checkhsum, index: { unique: true }, null: false
      t.integer :lines, null: false
      t.string :attachment, null: false

      t.timestamps
    end
  end
end
