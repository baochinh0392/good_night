module V1
  module SwaggerSchemas
    module Users
      USER_PARAMS = {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
        },
        required: %w(name email)
      }

      USER_RESPONSE = {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              id: { type: :string },
              type: { type: :string },
              attributes: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  name: { type: :string },
                  email: { type: :string },
                }
              }
            }
          }
        }
      }
    end
  end
end
