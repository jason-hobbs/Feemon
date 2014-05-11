class Feed < ActiveRecord::Base
  validates :title,:site,:url, presence: true, uniqueness: true
  has_many :entries, dependent: :destroy
  belongs_to :users
end
