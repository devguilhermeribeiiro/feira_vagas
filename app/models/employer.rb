# frozen_string_literal: true

class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validate :correct_profile_img_mime_type
  has_one_attached :profile_img
  has_many :jobs
  
  private

  def correct_profile_img_mime_type
    if profile_img.attached? && !profile_img.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:profile_img, 'deve ser uma imagem JPG, PNG ou GIF')
    elsif profile_img.attached? && profile_img.byte_size > 5.megabytes
      errors.add(:profile_img, 'deve ser menor que 5MB')
    end
  end
end
