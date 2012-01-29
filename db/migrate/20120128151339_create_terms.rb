class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.string :translated_term
      t.string :phonetic_spelling
      t.text :definition, :limit => nil

      t.timestamps
    end
  end
end
