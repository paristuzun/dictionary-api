class Entry < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :topic
  belongs_to :user
  #has_many :votes, as: :voteable

end
