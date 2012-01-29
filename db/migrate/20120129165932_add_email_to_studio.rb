class AddEmailToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :email, :string

  end
end
