class Service < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  validates_presence_of :title, :body

  mount_uploader :thumb_image, ServiceUploader
  mount_uploader :main_image, ServiceUploader

  def self.by_position
    order("position ASC")
  end
end
