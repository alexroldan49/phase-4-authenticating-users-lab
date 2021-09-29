class SessionsController < ApplicationController


    #login
    def create
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        if user
            render json: user
        else
            render json: {errors: "Wrong Username..."}, status: :unauthorized
        end
        
    end
    
    #logout
    def destroy
       session.delete :user_id
       head :no_content
    end
end
