class Job < ApplicationRecord
  belongs_to :employer

  validates_presence_of %i[ title location mode description requirements skills benefits salary ]

  has_many :applications, dependent: :destroy
  has_many :job_seekers, through: :applications
end
