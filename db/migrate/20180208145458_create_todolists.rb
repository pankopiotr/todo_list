class CreateTodolists < ActiveRecord::Migration[5.1]
  def change
    create_table :todolists do |t|
      t.string :name
      t.string :author

      t.timestamps
    end
  end
end
