class Entry < ActiveRecord::Base
  belongs_to :feeds
  has_many :dashboards
  has_many :topstories
  validates :title, presence: true, uniqueness: true
end
