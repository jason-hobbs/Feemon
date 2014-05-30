class Dashboard < ActiveRecord::Base
  validates :entry_title, presence: true, uniqueness: true
  belongs_to :user
  belongs_to :feed
  belongs_to :entry
  has_many :users, dependent: :destroy
  has_many :feeds
  has_many :entries
end
