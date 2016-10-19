class UsersController < ApplicationController
  def is_user?
    if User.find_by(params[:email])
      render json: { email_exists: true }
    else
      user = User.new(user_params)
      if user.save
        render json: { email_exists: false }
      else
        render json: { error: 'could not save new user data' }
    end
  end


  private
    def user_params
      params.permit(:first_name, :last_name, :email, :password, :project_name, :organiztion_name )
    end
end
