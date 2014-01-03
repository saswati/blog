class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @comment=Comment.paginate(:page => params[:page], per_page: 2)

  end


  def show
    @comment = Comment.find(params[:id])

  end


  def new
    @comment = Comment.new

  end


  def edit
    @comment = Comment.find(params[:id])
  end


  def create
    @commentable = find_commentable

    @comment = @commentable.comments.new
    @comment.body = params[:body]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :id => nil, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



end
