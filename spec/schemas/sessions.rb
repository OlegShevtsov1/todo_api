module Schemas
  class Sessions
    CREATE_REQUEST_SCHEMA =
      {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, format: :email, example: Examples::UserData.email },
              password: { type: :string, format: :password, example: Examples::UserData.password }
            }
          }
        },
        required: %w[user email password]
      }.freeze

    CREATE_RESPONSE_SCHEMA =
      {
        type: :object,
        properties: {
          status: { type: :integer, example: 200 },
          data: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              email: { type: :string, example: Examples::UserData.email },
              name: { type: :string, example: Examples::UserData.password }
            }
          }
        }
      }.freeze
  end
end
