class AddDescriptionToImage < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :description, :string
  end
end
