# frozen_string_literal: true

class Api::V1::ApiController < ApplicationController
  respond_to :json
  before_action :authenticate_token!
  before_action :authenticate_user!

  def current_user
    render json: { user: @current_user }
  end

  protected

  def authenticate_token!
    payload = JwtService.decode(token: auth_token)
    @current_user = User.find(payload[0]["sub"])
  rescue JWT::ExpiredSignature
    render json: { errors: ["Auth token has expired"] }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { errors: ["Invalid auth token"] }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  end
end
