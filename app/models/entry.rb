class Entry < ActiveRecord::Base
  include Voteable
  validates :body, presence: true
  belongs_to :topic
  belongs_to :user
  #has_many :votes, as: :voteable

end
