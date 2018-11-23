class Country
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :accounts

  field :name, type: String
  field :iso_2, type: String
  field :iso_3, type: String
  field :numeric, type: String
  field :active, type: Boolean, default: true

  validates :name, presence: true, uniqueness: true
  validates :iso_2, presence: true, uniqueness: true
  validates :iso_3, presence: true, uniqueness: true
  validates :numeric, presence: true, uniqueness: true
end
