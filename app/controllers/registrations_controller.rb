class RegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
    puts "Working"
    resource.unhashed_password = resource_params[:password]
    resource.send_confirmation_instructions
  end
end
# customize session controller
