class Durian < ActiveRecord::Base
  has_many :order
  belongs_to :cream
  belongs_to :sweet
end