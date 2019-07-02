class SessionsController < ApplicationController
    include CurrentUserConcern
	def create
		user = User.find_by(email: params["user"]["email"])
		           .try(:authenticate,password: params["user"]["password"])
		if user
			render json: {
				status: "created",
				logged_in: true,
				user: user
			}
		else
			render json: { status: 401}
		end
	end

	def loged_in
		if @current_user
			render json: {
				logged_in: true,
				user: @current_user
			}
		else
			render json: {
				logged_in: false
			}
		end
	end

	def logout
		reset_session
		render json: { status: 200, logged_out: true}
	end

end