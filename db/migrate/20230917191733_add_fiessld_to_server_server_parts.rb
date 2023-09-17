class AddFiessldToServerServerParts < ActiveRecord::Migration[7.0]
  def change
    add_column :server_server_parts, :server_corpu_id, :integer
  end
end
