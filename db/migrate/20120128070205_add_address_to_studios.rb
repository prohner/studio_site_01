class AddAddressToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :address2, :string

    add_column :studios, :city, :string

    add_column :studios, :state, :string

    add_column :studios, :postal_code, :string

    add_column :studios, :phone, :string

    add_column :studios, :fax, :string

  end
end
