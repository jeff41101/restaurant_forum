class CreateRestauramts < ActiveRecord::Migration[5.2]
  def change
    create_table :restauramts do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :opening_hours
      t.text :description
      t.timestamps
      t.timestamps
    end
  end
end
