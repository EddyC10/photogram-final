class HomeController < ApplicationController 

  def index
    id = session.fetch(:user_id)
    matching_user = User.where({ :id => id })

    @users = User.order({ :username => :asc })

    render({ :template => "home_templates/index.html.erb" })
  end

end
