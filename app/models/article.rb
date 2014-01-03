class Article < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :comments
  validates :title, :presence => true ,
            :length => { :maximum => 50}

  validates :content, :presence => true
  default_scope :order => 'articles.created_at DESC'

end
