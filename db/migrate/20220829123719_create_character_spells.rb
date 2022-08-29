class CreateCharacterSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :character_spells do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
