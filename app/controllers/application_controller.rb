class ApplicationController < ActionController::Base
     protect_from_forgery with: :exception, prepend: true
        include ApplicationHelper
        helper_method :current_user #make this method available in views
        before_action :configure_permitted_parameters, if: :devise_controller?
        
        
         protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :omniauth_status, :omniauth_type
               )}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,:password_confirmation, :current_password)}
          end
          
end
