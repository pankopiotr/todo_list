class SetNotNullConstraintOnPrivateTodolists < ActiveRecord::Migration[5.1]
  def change
    change_column_null :todolists, :private, false
  end
end
