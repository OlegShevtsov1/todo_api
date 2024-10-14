require 'swagger_helper'
require 'schemas/sessions'

RSpec.describe 'users/sessions', type: :request do
  let!(:user) { create :user, :example }
  let(:token) { jwt_token(user) }
  let(:Authorization) { "Bearer #{token}" }
  let(:email) { user.email }
  let(:password) { user.password }

  path '/login' do
    post 'Sing in' do
      tags 'Users'
      response 200, 'successful' do
        consumes 'application/json'
        produces 'application/json'
        parameter name: :params, in: :body, schema: Schemas::Sessions::CREATE_REQUEST_SCHEMA
        schema_data_obj Schemas::Sessions::CREATE_RESPONSE_SCHEMA

        let(:params) do
          { user: { email:, password: } }
        end
        let(:payload) { { 'id' => user.id, 'email' => user.email, 'name' => user.name, 'token' => token } }

        run_test_with_example! do
          expect(json_response['data']).to eq(payload)
        end
      end
    end
  end
end
