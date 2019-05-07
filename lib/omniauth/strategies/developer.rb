module OmniAuth
  module Strategies
    class Developer
      include OmniAuth::Strategy

      def request_phase
        form = OmniAuth::Form.new(title: 'Local Developer Sign In', url: callback_path)
        form.button 'Sign In'
        form.to_response
      end

      uid { 'localuser@test.com' }

      info do
        {
          email: 'localuser@test.com',
          name: 'localuser'
        }
      end
    end
  end
end
