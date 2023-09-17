class CreateServerParts < ActiveRecord::Migration[7.0]
  def change
    create_table :server_parts do |t|
      t.string :name

      t.timestamps
    end
  end
end
