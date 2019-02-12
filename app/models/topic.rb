class Topic < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :topic_categories
  has_many :categories, through: :topic_categories
  before_save :generate_slug

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end
end
