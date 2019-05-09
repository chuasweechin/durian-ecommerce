class Delivery < ActiveRecord::Base
  has_many :order
end