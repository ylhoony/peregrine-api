class Country
  include Mongoid::Document

  field :name, type: String
  field :iso_2, type: String
  field :iso_3, type: String
  field :active, type: Boolean, default: true

  validates :name, presence: true, uniqueness: true
  validates :iso_2, presence: true, uniqueness: true
  validates :iso_3, presence: true, uniqueness: true
end
