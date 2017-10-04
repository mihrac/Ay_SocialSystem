class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.date :bdate
      t.string :grad
      t.string :school
      t.string :city
      t.text :about

      t.timestamps
    end
  end
end
