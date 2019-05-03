class Order < ActiveRecord::Base
  belongs_to :durian
  belongs_to :cream
  belongs_to :taste
end