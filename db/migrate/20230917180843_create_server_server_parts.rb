class CreateServerServerParts < ActiveRecord::Migration[7.0]
  def change
    create_table :server_server_parts do |t|
      t.integer :server_id
      t.integer :server_part_id

      t.timestamps
    end
  end
end
