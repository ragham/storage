class CommentsController < ApplicationController
before_filter :authenticate_user!

   def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(params[:comment])
      if @comment.save
        ;flash[:notice]='Comment was created'
        redirect_to (@comment.post)
      else
        ;flash[:notice]="Error creating comment: #{@comment.errors}"
        #render :action => 'new'
        redirect_to @comment.post
      end
    end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end

 

