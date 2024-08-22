class Job < ApplicationRecord
  belongs_to :employer

  validates_presence_of %i[ title location mode description requirements skills benefits salary ]
end
