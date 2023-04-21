class FollowRequestController < ApplicationController

  def follow_request
    new_request = FollowRequest.new 

    new_request.recipient_id = params.fetch("query_recipient_id")

    if @current_user.private? == true
      #new_request.sender_id = params.fetch("query_sender_id")
      new_request.status = "pending"
      new_request.save
    else
      new_request.status = "accepted"
      new_request.save
    end

    redirect_to("/users")
  end
  
end
