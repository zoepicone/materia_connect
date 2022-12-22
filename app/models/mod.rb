class Mod < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :fuzzy_search,
                  against: [:title, :description, :tags],
                  associated_against: { user: :username },
                  ignoring: :accents,
                  using: {
                    trigram: { word_similarity: true, only: %i[title tags] },
                    tsearch: { prefix: true, dictionary: 'english' }
                  }

  self.implicit_order_column = 'created_at'

  # must have at least one image
  has_many_attached :images

  validates :title, presence: true, uniqueness: true, length: { maximum: 48 }
  validates :description, presence: true, length: { maximum: 2048 }
  validates :download_url, presence: true, http_url: true, length: { maximum: 256 }
  validates :user_id, presence: true

  belongs_to :user

  attr_accessor :tag_string

  before_save :set_tags, if: :tag_string
  before_save :fix_booleans

  def set_tags
    self.tags = tag_string.downcase.split(',').map(&:strip)
  end

  def fix_booleans
    %i[nsfw unlisted premium].each do |param|
      self[param] = false unless self[param]
    end
  end

  def creator = user.username

  def public? = !unlisted

  def self.search(query)
    return nil if query.blank?

    query = query.downcase.strip
    fuzzy_search(query)
  end
end
