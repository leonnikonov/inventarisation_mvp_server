class ServerCorpu < ApplicationRecord
  has_many :server_server_parts
  has_many :server_parts, through: :server_server_parts
end
