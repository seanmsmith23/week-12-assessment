class Movie < ActiveRecord::Base
  validates :name, :year, presence: true
  validates :year, numericality: true
end
