module V1
  module SwaggerSchemas
    module Friends
      FRIEND_PARAMS = {
        type: :object,
        properties: {
          friend_id: { type: :integer },
        },
        required: %w(friend_id)
      }

      FRIEND_RESPONSE = {
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
                  user: {
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
                    },
                  },
                  friend: {
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
                    },
                  }
                }
              },
            }
          },
        }
      }
    end
  end
end
