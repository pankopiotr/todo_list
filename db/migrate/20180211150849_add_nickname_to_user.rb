class AddNicknameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string, default: "", null: false
  end

  add_index :users, :nickname, unique: true
end
