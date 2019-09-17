class ChangePostalCodeOptionsToAddressesPostalCode < ActiveRecord::Migration[5.2]
  def up
  	change_column :addresses,:postal_code_1, :string
  	change_column :addresses,:postal_code_2, :string
  end
  def down
  	change_column :addresses, :postal_code_1, :string, null: false, default: "000", limit: 3
    change_column :addresses, :postal_code_2, :string, null: false, default: "0000", limit: 4
  end
end
