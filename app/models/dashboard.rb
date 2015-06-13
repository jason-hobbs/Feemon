class Dashboard < ActiveRecord::Base

  belongs_to :user
  belongs_to :feed
  belongs_to :entry
  has_many :users
  has_many :feeds
  has_many :entries
end
