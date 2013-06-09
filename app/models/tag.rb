class Tag < ActiveRecord::Base
  belongs_to :story
  belongs_to :category
  # attr_accessible :title, :body
end
