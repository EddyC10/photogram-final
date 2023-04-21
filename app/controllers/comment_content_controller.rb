class CommentContentController < ApplicationController

  def create_comment
    photo_id = params.fetch("query_photo_id")

    comment = Comment.new
    comment.body = params.fetch("query_comment")
    comment.photo_id = photo_id
    comment.author_id = session.fetch(:user_id)

    comment.save

    redirect_to("/photos/#{comment.photo_id}")
  end
  
end
