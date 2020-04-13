class ChangeAdminOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :admin, to: false
  end
end
