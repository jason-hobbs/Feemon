class Feed < ActiveRecord::Base
  validates :title,:site,:url, presence: true, uniqueness: true
  has_many :entries, dependent: :destroy
  has_many :users
  belongs_to :users

end
