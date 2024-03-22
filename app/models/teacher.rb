class Teacher < ApplicationRecord
    has_many :master_timetables, dependent: :destroy
    acts_as_paranoid
    has_one_attached :image

    validates :name, presence: true
  validates :designation, presence: true
  validates :qualification, presence: true
  validates :experience, presence: true
  validates :area_of_expertise, presence: true
  validates :department, presence: true
  validate :image_presence 

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
  
end
