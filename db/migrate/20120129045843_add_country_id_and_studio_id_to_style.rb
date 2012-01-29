class AddCountryIdAndStudioIdToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :country_id, :integer

    add_column :styles, :studio_id, :integer

  end
end
