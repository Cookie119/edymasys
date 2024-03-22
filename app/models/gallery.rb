class Gallery < ApplicationRecord
    acts_as_paranoid
    
    has_one_attached :image
    attribute :title, :string

  validates :title, presence: true
  validates :image, presence: true
end
