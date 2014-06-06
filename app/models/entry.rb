class Entry < ActiveRecord::Base
  belongs_to :feeds
  has_many :dashboards, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
