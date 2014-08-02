class AddHyperlinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :hyperlink, :string
  end
end
