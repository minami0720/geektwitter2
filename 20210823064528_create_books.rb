class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :about
      t.string :category

      t.timestamps
    end
  end
end
