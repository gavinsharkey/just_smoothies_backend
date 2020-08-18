class Smoothie < ApplicationRecord
  has_one_attached :picture

  def self.by_created
    order(created_at: :desc)
  end

  def picture_url
    Rails.application.routes.url_helpers.rails_blob_url(self.picture, only_path: true)
  end
end
