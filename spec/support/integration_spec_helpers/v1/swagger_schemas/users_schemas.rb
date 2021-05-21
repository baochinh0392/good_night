module V2
  module SwaggerSchemas
    module Users
      PARAMS = {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string },
          },
          required: %w(name email)
        }

        RESPONSE = {
          type: :object,
          properties: {
            id: { type: :integer }
            name: { type: :string },
            email: { type: :string },
          }
        }
    end
  end
end
