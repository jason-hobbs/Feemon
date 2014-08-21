class Feed < ActiveRecord::Base
  validates :title,:site,:url, presence: true, uniqueness: true
  has_many :entries, dependent: :destroy
  has_many :userfeeds, dependent: :destroy
  has_many :users, through: :userfeeds
  has_many :dashboards, dependent: :destroy
end
