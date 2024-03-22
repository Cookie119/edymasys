class Addstudent < ApplicationRecord
    has_one_attached :photograph
    validate :validate_photograph_format
    validate :validate_marital_status_selection
    validate :validate_Gender_selection

    private
  
    def validate_photograph_format
      return unless photograph.attached?
  
      unless photograph.image?
        errors.add(:photograph, "must be an image file")
      end
    end
    validates :enrollment_number, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :middle_name, presence: true
    validates :surname, presence: true
    validates :date_of_birth, presence: true
    validates :phone_number, presence: true, numericality: { only_integer: true }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    validates :address, presence: true
    validates :fathers_name, presence: true
    validates :mothers_name, presence: true
    validates :parents_phone_number, presence: true, numericality: { only_integer: true }
    validates :job_placement, presence: true

    def validate_marital_status_selection
      if marital_status == "Select_Status"
        errors.add(:marital_status, "must be selected")
      end
    end
    def validate_Gender_selection
      if gender == "Select_Gender"
        errors.add(:gender, "must be selected")
      end
    end
 
end
  
