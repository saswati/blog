class ProfilesController < ApplicationController
before_filter :authenticate_user!
before_filter :find_profile, except: [:new,:create, :index ]

def new
  @title = "Profile"
  @profile = Profile.new
end

def show

end

def create
  suffix = params[:sufix]
  f_n = params[:first_name]
  l_n = params[:last_name]
  a=params[:profile]
  a.merge!({:name => "#{suffix} #{f_n} #{l_n}"})
  #@avatars= @profile.avatars
  @profile = Profile.new(a)
  if @profile .save
    flash[:success]= "Welcome to Your Profile"                         #  Parameters: {"utf8"=>"✓", "authenticity_token"=>"KPJGSVoW2naygRG1HFKCLmOtyZdold+zyfKadUMzZcA=", "sufix"=>"miss", "first_name"=>"addf", "last_name"=>"vcvjhgjh", "user"=>{"email"=>"dfgfhgk", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign up"}
    redirect_to @profile
  else
    @title = "Profile"
    render 'new'
  end
end

def edit
  @title = "Edit profiles"
end

def update
  suffix = params[:profile][:sufix]
  f_n = params[:profile][:first_name]
  l_n = params[:profile][:last_name]
  a=params[:profile]
  a.delete_if{|k,v| ["sufix", "first_name", "last_name"].include?(k)}    #To control mass assignment delete params.
  a.merge!({:name => "#{suffix} #{f_n} #{l_n}"})
  if @profile.update_attributes(a)
    flash[:success] = "Profile Updated."                                            #After delete the params check the difference between create and update
    redirect_to @profile                                                               #  Parameters: {"utf8"=>"✓", "authenticity_token"=>"KPJGSVoW2naygRG1HFKCLmOtyZdold+zyfKadUMzZcA=", "user"=>{"sufix"=>"miss", "first_name"=>"addf", "last_name"=>"vcvjhgjh", "email"=>"dfgfhgk", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign up", "id"=>"8"}
  else
    @title = "Edit profile"
    render 'edit'
  end
end

def index
  @profile=Profile
end

end



private
def find_profile
  @profile= Profile.find(params[:id])
end