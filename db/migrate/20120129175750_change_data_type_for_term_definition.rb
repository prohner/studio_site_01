class ChangeDataTypeForTermDefinition < ActiveRecord::Migration
  def up
    change_table :terms do |t|
      t.change :definition, :text
    end
  end

  def down
    change_table :terms do |t|
      t.change :definition, :string
    end
  end
end
