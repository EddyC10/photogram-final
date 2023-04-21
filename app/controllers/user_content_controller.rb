class UserContentController < ApplicationController

  def all_users
    @users = User.order({ :username => :asc })

    render({ :template => "user_templates/all_users.html.erb" })
  end

  def user_details
    username = params.fetch("name")

    @matching_user = User.where({ :username => username }).at(0)

    if @current_user == nil
      redirect_to("/user_sign_in", :alert => "You have to sign in first")
    else
      render({ :template => "user_templates/user_details.html.erb"})
    end
  end

  def liked_photos
    user_like = Like.new

    user_like.fan_id = session.fetch(:user_id)
    user_like.photo_id = params.fetch("query_photo_id")

    user_like.save

    redirect_to("/photos/#{user_like.photo_id}", :notice => "Like created successfully")
  end

  def unliked_photos
    id = params.fetch("id")

    liked_photo = Like.where({ :fan_id => @current_user.id })
    liked_photo = liked_photo.where({ :photo_id => id }).at(0)

    liked_photo.destroy

    redirect_to("/photos/#{id}", :notice => "Like deleted successfully")
    #redirect_to("/")
  end

  #the user liked_photos, feed, and discover beyong this point 

  def the_user_liked_photos
    username = params.fetch("username")

    @matching_user = User.where({ :username => username}).at(0)

    render( :template => "user_templates/user_liked_photos.html.erb")
  end

  def the_user_feed
    username = params.fetch("username")

    @matching_user = User.where({ :username => username}).at(0)

    render( :template => "user_templates/user_feed.html.erb")
  end

  def the_user_discover
    username = params.fetch("username")

    @matching_user = User.where({ :username => username}).at(0)

    @all_users = User.all

    render( :template => "user_templates/user_discover.html.erb")
  end

end
