class Country
  include Mongoid::Document

  field :name, type: String
  field :iso_2, type: String
  field :iso_3, type: String
  field :active, type: Boolean
end
