class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :create]

   def after_sign_in_path_for(resource)
    	user_path(@user)
    end

    def after_sign_up_path_for(resource)
    	user_path(@user)
    end

    protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:password])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image])
    end


end
