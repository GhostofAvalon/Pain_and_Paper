class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.float :height
      t.integer :level
      t.text :description
      t.integer :age
      t.float :weight
      t.string :gender
      t.references :user, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true
      t.references :class, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :characteristic_list, null: false, foreign_key: true
      t.references :background, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
