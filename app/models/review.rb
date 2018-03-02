class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :product

  validates :description, presence: true
  validates :rating, presence: true, numericality: {greater_than: 0, less_than: 6}

end
