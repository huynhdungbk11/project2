class Suggestion < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: {mini: Settings.image.mini,
    medium: Settings.image.medium,
    thumb: Settings.image.thumb},
    default_url: Settings.image.default_url
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
