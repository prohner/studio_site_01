class ChangeDataTypeForTermDefinition2 < ActiveRecord::Migration
  def up
    change_table :terms do |t|   
        t.change :definition, :text, :limit => nil
    end    
  end

  def down
    change_table :terms do |t|   
        t.change :definition, :string
    end    
  end
end
