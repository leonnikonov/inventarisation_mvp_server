class ServerCorpu < ApplicationRecord
  has_many :server_server_parts
  has_many :server_parts, through: :server_server_parts

  def bind_part(part_id)
    ServerServerPart.create(server_corpu_id: id, server_part_id: part_id)
  end

end
