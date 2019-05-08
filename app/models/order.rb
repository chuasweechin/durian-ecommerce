class Order < ActiveRecord::Base
  belongs_to :durian
  belongs_to :user
end