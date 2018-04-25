class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn_number

      t.timestamps null: false
    end
  end
end
