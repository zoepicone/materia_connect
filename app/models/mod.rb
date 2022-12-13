class Mod < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # has_many :mod_tags, dependent: :destroy
  # has_many :tags, through: :mod_tags
  # has_many :mod_authors, dependent: :destroy
  # has_many :authors, through: :mod_authors
  # has_many :mod_dependencies, dependent

  has_many_attached :image

  validates :title, presence: true, uniqueness: true, length: { maximum: 48 }
  validates :description, presence: true
  validates :download_url, presence: true
  validates :user_id, presence: true

  attr_accessor :tag_string

  before_save :set_tags, if: :tag_string

  def set_tags
    self.tags = tag_string.split(',').map(&:strip)
  end
end
