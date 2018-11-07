# frozen_string_literal: true

class JWTBlacklist
  include Mongoid::Document
  include Devise::JWT::RevocationStrategies::Blacklist

  # self.table_name = 'jwt_blacklist'

  field :jti, type: String
  index({ jti: 1 }, {unique: true})
end
