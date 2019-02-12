class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true, counter_cache: true
  validates_uniqueness_of :user, scope: :voteable
end
