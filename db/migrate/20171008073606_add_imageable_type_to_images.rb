class AddImageableTypeToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :imageable_type, :string
  end
end
