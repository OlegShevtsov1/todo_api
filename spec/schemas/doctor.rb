module Schemas
  class Doctor
    FETCH_RESPONSE_SCHEMA = {
      type: :object,
      properties: {
        id: { type: :string, example: '1' },
        type: { type: :string, example: 'doctor' },
        attributes: {
          type: :object,
          properties: {
            id: { type: :integer, example: 1 },
            name: { type: :string, example: Examples::DoctorData.name }
          },
          required: %w[id name]
        }
      },
      required: %w[id type attributes]
    }.freeze

    CREATE_REQUEST_SCHEMA = {
      type: :object,
      properties: {
        name: { type: :string },
        age: { type: :integer },
        city_id: { type: :integer },
        user_id: { type: :integer },
        description: { type: :string },
        image_url: { type: :string },
        detail_attributes: {
          type: :object,
          properties: {
            price: { type: :integer },
            specialization: { type: :string },
            studies: { type: :string }
          }
        }
      },
      required: %w[
        name age city_id user_id description image_url
        detail_attributes price specialization studies
      ]
    }.freeze
  end
end
