class PhotoContentController < ApplicationController

  def public_photos
    @photos = Photo.order({ :created_at => :desc })

    render({ :template => "photo_templates/public_photos.html.erb" })
  end


  def photo_details
    photo_id = params.fetch("photo_id") 
    @photo = Photo.where( :id => photo_id ).at(0)

    if @current_user == nil 
      redirect_to("/user_sign_in", :alert => "You have to sign in first ")
    else
      render( :template => "photo_templates/photo_details.html.erb")
    end
  end

  def create_photo
    photo = Photo.new
    photo.image = params.fetch("query_image")
    photo.caption = params.fetch("query_caption")
    photo.owner_id = session.fetch(:user_id)

    if photo.valid?
      photo.save
      redirect_to("/photos", :notice => "Photo created successfully")
    else
      redirect_to("/photos", :alert => photo.errors.full_messages.to_sentence)
    end
  end

end
