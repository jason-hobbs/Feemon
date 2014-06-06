class Entry < ActiveRecord::Base
  belongs_to :feeds
  has_many :dashboards, dependent: :destroy
  validates :entry_title, presence: true, uniqueness: true
end
