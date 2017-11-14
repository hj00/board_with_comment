class PostController < ApplicationController
  def index # 게시글 다 보여주는 페이지
  @posts = Post.all # [게시글 1, 게시글2, 게시글 3]
  end

  def new # 게시글 작성하는 form있는 페이지
  end

  def create # 작성된 게시글 db에 넣는 action
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: session[:user_id]
    )
    
    redirect_to '/'
  end

  def show # 한 개의 게시글 보는 페이지
    @post = Post.find(params[:id])
    # @comments = Comment.find(params[:id])
  end
  
  def create_comment # 해당하는 글의 댓글 다는 Action
    Comment.create(
      content: params[:content],
      post_id: params[:id]
    )
    redirect_to :back
  end
  
  
end
