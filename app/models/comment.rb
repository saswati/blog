class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :article
  has_and_belongs_to_many :users

  validates :body, :presence => true ,
            :length => { :maximum => 5000}

end
