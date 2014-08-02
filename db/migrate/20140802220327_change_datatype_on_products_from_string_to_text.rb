class ChangeDatatypeOnProductsFromStringToText < ActiveRecord::Migration
  def up
    change_column :products, :description, :text, :limit => nil
  end

  def down
    change_column :products, :description, :string
  end
end
