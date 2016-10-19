class UsersController < ApplicationController
  def create
    if User.find_by(email: params[:email])
      puts 'yes!' * 10
      render json: { email_exists: true }
    else
      user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], project_name: params[:project_name], organization_name: params[:organization_name] )
      if user.save
        render json: { email_exists: false}
      else
        render json: { error: 'could not save new user data' }
      end
    end
  end


  private
    def user_params
      params.permit(:first_name, :last_name, :email, :password, :project_name, :organization_name )
    end
end
