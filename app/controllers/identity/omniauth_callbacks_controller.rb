module Identity
  class OmniauthCallbacksController < ::Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token, only: :developer
    before_action :redirect_unless_development, only: :developer

    # Only sign in with development env
    def developer
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        @user.update(confirmed_at: Time.zone.now)
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'developer')
      else
        redirect_to new_user_session_path
      end
    end

    def failure
      redirect_to new_user_session_path
    end

    private

    def redirect_unless_development
      return if Rails.env.development?

      redirect_to new_user_session_path
    end
  end
end
