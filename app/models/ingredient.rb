class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true
  validates_uniqueness_of :name

  scope :ordered, -> { order(name: :asc) }
end
