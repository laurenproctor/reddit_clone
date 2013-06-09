class Story < ActiveRecord::Base
  attr_accessible :title, :link, :category, :tag_list

  #validates :title, :link, :category, :upvotes, presence: true
  #validates :link, format: {with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix}
  validates :title, :upvotes, presence: true
  validates :link, uniqueness: true

  has_many :tags
  has_many :categories, through: :tags

  def tag_list
  	self.categories.pluck(:name)
  end

  def tag_list=(tags)
  	tags.split(", ").each do |tag|
  		self.categories << Category.where(name: tag).first_or_create
  	end
  end

  def self.search_for(query)
  	where('title LIKE :search_query', search_query: "%#{query}%")
  end
end
