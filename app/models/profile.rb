class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor :sufix, :first_name, :last_name
  attr_accessible :avatar, :name, :sufix, :first_name, :last_name


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  belongs_to :user

  ["sufix","first_name","last_name"].each_with_index do |name,index|
    define_method "#{name}" do
      self.name.split(" ")[index]     #split an array(name) by index[0,1,2]
    end
  end

  def has_attached_file(name, options = {})
    HasAttachedFile.define_on(self, name, options)
  end

end
