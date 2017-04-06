class AddHst < ActiveRecord::Migration[5.0]
  def change
    add_column :provinces, :hst, :string
  end
end
