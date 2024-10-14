module Helpers
  module Api
    module V1
      module AuthenticateHelper
        def authorization_header_for(user)
          return unless user

          @request.env['HTTP_AUTHORIZATION'] = "Bearer #{jwt_token(user)}"
        end

        def jwt_token(user)
          token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
          token[0]
        end
      end
    end
  end
end
