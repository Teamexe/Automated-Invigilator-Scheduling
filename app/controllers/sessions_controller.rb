class SessionsController < Devise::SessionsController

  after_action :unauthenticated
  def create
  self.resource = warden.authenticate(auth_options)
#   flash[:notice]="Failed" if resource.nil?
# flash.clear unless params['action'] == 'new'
  redirect_to new_teacher_session_path(error: "error" ) and return if resource.nil?
    # flash[:notice]=:signed_in
    set_flash_message!(:notice, :signed_in)
  sign_in(resource_name, resource)
  yield resource if block_given?
  respond_with resource, location: after_sign_in_path_for(resource)
end

protected

def unauthenticated
  flash[:alert] = t("devise.failure.#{request.env['warden'].message}") unless request.env['warden'].message.blank?
end

  
end