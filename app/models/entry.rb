class Entry < ActiveRecord::Base
  belongs_to :feeds
  has_many :dashboards, dependent: :destroy
end
