class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: user.to_json(:except => :password_digest)
        else
            render json: {
                error: "Error"
            }
            
        end
    end

    def show
        if(user_params[:id] == session[:user_id])
            binding.pry
        else
            binding.pry
        end

    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
