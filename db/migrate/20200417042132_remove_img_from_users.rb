class RemoveImgFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :img, :string
  end
end
