class Order < ActiveRecord::Base
  belongs_to :durian
  belongs_to :delivery
end