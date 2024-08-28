# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :job
  belongs_to :job_seeker

  after_create :set_status

  private

  def set_status
    self.status = true if status.eql?(false)
  end
end
