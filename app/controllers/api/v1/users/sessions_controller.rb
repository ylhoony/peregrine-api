# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def create
    self.resource = User.find_by(email: sign_in_params[:email])

    if resource.persisted?
      if resource.valid_password?(sign_in_params[:password])
        sign_in(resource_name, resource) # Update sign in record with Devise method.

        payload = {
          sub: resource.id.to_str,
          iat: Time.now.to_i,
          exp: Time.now.to_i + 24 * 60 * 60,
        }

        token = JwtService.encode(payload: payload)

        response['Authorization'] = token
        render json: { current_user: resource }
      else
        # binding.pry
        render json: { errors: "Incorrect username or password." }
      end
    else
      # binding.pry
      render json: { errors: resource.errors.messages }
    end

  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
