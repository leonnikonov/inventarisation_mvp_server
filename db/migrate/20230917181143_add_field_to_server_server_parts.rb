class AddFieldToServerServerParts < ActiveRecord::Migration[7.0]
  def change
    add_column :server_server_parts, :server_corpus_id, :integer
  end
end
