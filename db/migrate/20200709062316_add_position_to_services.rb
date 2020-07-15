class AddPositionToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :position, :integer
  end
end
