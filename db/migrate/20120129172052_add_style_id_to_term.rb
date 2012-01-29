class AddStyleIdToTerm < ActiveRecord::Migration
  def change
    add_column :terms, :style_id, :integer

  end
end
