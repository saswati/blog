class Page < ActiveRecord::Base

  #has_many :articles
  has_attached_file :avatars, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
