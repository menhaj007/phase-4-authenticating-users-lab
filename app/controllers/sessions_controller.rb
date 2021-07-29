class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        # byebug
        if user
            session[:user_id] ||= user.id
            render json: user
        else
            # render json: {errors: user.errors.full_messages}, status: :not_found # why it is not working
            render json: {error: "Not found"}, status: :not_found
        end

    end

    def destroy
        session.delete :user_id
        head :no_content
    end

 

    private
    def user_params
        params.permit(:username)
    end
end
