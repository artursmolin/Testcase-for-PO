# frozen_string_literal: true

class CreateDeclensions < ActiveRecord::Migration[5.2]
  def change
    create_table :declensions do |t|
      t.text :genitive
      t.text :dative
      t.text :accusative
      t.text :instrumental
      t.text :prepositional

      t.references :person, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
