class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :chapter, index: true#, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
