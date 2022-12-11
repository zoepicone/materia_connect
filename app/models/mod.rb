class Mod < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # has_many :mod_tags, dependent: :destroy
  # has_many :tags, through: :mod_tags
  # has_many :mod_authors, dependent: :destroy
  # has_many :authors, through: :mod_authors
  # has_many :mod_dependencies, dependent

  validates :title, presence: true
  validates :description, presence: true
  validates :download_url, presence: true
end
