class CreateBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :backgrounds do |t|
      t.string :name
      t.string :specificity
      t.text :story

      t.timestamps
    end
  end
end
