class CommentsController < ApplicationController  

  def create
    @comment = Comment.new(comment_params)

    @post = Post.find(params[:comment][:post_id])
    @user = @post.user
   
      if @comment.save
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      else
        format.html { render :new }
        format.js
      end
   
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
