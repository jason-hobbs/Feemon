class Feed < ActiveRecord::Base
  validates :title,:site,:url, presence: true, uniqueness: true
  
end
