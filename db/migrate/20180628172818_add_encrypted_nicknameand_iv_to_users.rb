class AddEncryptedNicknameandIvToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :encrypted_nickname, :string
    add_column :users, :encrypted_nickname_iv, :string
  end
end
