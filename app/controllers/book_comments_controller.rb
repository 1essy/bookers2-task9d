class BookCommentsController < ApplicationController
  def create
    book = book.find(params[:post_image_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end
  
  def destroy
  end
  
  private
  
  def book_comment_params
  params.require(:book_comment).permit(:comment)
  end
end
