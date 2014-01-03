class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @article = Article.last!
      #@feed_items = current_user.feed.paginate(:page => params[:page],per_page: 3)
      @comment = Comment.all
    end
    respond_to do |format|
      if request.xhr?
        format.js
      else
        format.html
      end
    end
  end

  def about
    @title = "About"
    respond_to do |format|
      if request.xhr?
        format.js{}
      else
        format.html
      end
    end
  end

  def news
    @title = "News"
    respond_to do |format|
      if request.xhr?
        format.js
      else
        format.html
      end
    end
  end

  def books
    @title = "Books"
    respond_to do |format|
      if request.xhr?
        format.js{}
      else
        format.html
      end
    end
  end
end
