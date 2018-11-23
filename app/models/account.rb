class Account
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :country
  has_many :employees

  field :company_name, type: String
  field :contact, type: String
  field :address_1, type: String
  field :address_1, type: String
  field :city, type: String
  field :state, type: String
end
