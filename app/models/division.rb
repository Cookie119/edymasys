class Division < ApplicationRecord
    has_many :master_timetables, dependent: :destroy
    validates :division, presence: true
end
