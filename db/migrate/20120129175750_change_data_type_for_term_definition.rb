class ChangeDataTypeForTermDefinition < ActiveRecord::Migration
  def up
    change_column :terms, :definition, :text
  end

  def down
    change_column :terms, :definition, :string
  end
end
