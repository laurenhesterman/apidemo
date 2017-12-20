class API::V1::UsersController < ApplicationController
  def index
    render jsonapi: User.all,
        fields: { 
          users: [:email]
        },
        class: {
          User: API::V1::SerializableUser
        }
  end

  def create
    user = User.new(user_params)

    if user.save
      render jsonapi: user,
        fields: { 
          users: [:email]
        },
        class: {
          User: API::V1::SerializableUser
        }
    else 
      render json: { error: "Problems" }
    end
  end

  def update
    # Put and update
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit!(:email, :password, :username, :first_name, :last_name)
  end
end
