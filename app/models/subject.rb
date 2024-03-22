class Subject < ApplicationRecord
    has_many :master_timetables, dependent: :destroy
    validates :name, presence: true
end
