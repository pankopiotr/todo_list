class RemoveNicknameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nickname, :string, default: "", null: false
  end
end
