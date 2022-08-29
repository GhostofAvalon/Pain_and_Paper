class CreateCharacteristicsLists < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristics_lists do |t|
      t.integer :force_value
      t.integer :dexterity_value
      t.integer :constitution_value
      t.integer :intelligence_value
      t.integer :charisma_value
      t.integer :wisdom_value

      t.timestamps
    end
  end
end
