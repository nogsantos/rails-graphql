class AddPictureToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :picture, :binary
  end
end
