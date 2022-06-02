class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def response_with(_resource, _opts = {})
    render json: {
      message: 'You have been successfully signed in',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: 'You have been successfully signed out' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Sign out failed' }, status: :unauthorized
  end
end
