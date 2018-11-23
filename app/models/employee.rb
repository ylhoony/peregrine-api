class Employee
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :account
  belongs_to :user

  field :title, type: String
  field :active, type: Boolean, default: true
end
