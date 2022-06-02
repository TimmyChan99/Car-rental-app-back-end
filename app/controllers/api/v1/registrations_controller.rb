class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def response_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'You have been successfully registered',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Registration failed' }, status: :unprocessable_entity
  end
end
