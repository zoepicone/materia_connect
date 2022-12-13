class Mod < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # has_many :mod_tags, dependent: :destroy
  # has_many :tags, through: :mod_tags
  # has_many :mod_authors, dependent: :destroy
  # has_many :authors, through: :mod_authors
  # has_many :mod_dependencies, dependent

  # must have at least one image
  has_many_attached :images

  validates :title, presence: true, uniqueness: true, length: { maximum: 48 }
  validates :description, presence: true, length: { maximum: 2048 }
  validates :download_url, presence: true, length: { maximum: 256 }
  validates :user_id, presence: true

  attr_accessor :tag_string

  before_save :set_tags, if: :tag_string

  def set_tags
    self.tags = tag_string.split(',').map(&:strip)
  end
end
