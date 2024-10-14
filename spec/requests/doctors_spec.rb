require 'swagger_helper'
require 'schemas/doctor'

RSpec.describe 'doctors', type: :request do
  let(:user) { create :user, :example }
  let(:Authorization) { "Bearer #{jwt_token(user)}" }

  path '/doctors' do
    get 'List doctors' do
      tags 'Doctors'
      produces 'application/json'
      response 200, 'successful' do
        schema_data(Schemas::Doctor::FETCH_RESPONSE_SCHEMA)

        let!(:doctor) { create :doctor, :example }
        let(:payload) do
          [{ 'attributes' => {
               'id' => doctor.id,
               'name' => doctor.name
             },
             'id' => doctor.id.to_s,
             'type' => 'doctor' }]
        end

        run_test_with_example! do
          expect(json_response['data']).to eq(payload)
        end
      end
    end

    post('Create a doctor') do
      tags 'Doctors'
      response 200, 'successful' do
        let(:params) { { doctor: { name: :name } } }
        consumes 'application/json'
        parameter name: :params, in: :body, schema: Schemas::Doctor::CREATE_REQUEST_SCHEMA

        run_test_with_example! do
          expect(json_response['data']).to eq(payload)
        end
      end
    end
  end

  path '/doctors/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show a doctor information') do
      tags 'Doctors'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('Delete a doctor') do
      tags 'Doctors'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
