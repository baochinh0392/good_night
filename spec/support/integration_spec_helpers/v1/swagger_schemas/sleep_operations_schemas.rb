module V1
  module SwaggerSchemas
    module SleepOperations
      SLEEP_PARAMS = {
          type: :object,
          properties: {
            sleep_time: { type: :string },
          },
          required: %w(sleep_time)
        }

        GET_UP_PARAMS = {
          type: :object,
          properties: {
            get_up_time: { type: :string },
          },
          required: %w(get_up_time)
        }

        SLEEP_OPERATION = {
          type: :object,
          properties: {
            id: { type: :string },
            type: { type: :string },
            attributes: { 
              type: :object,
              properties: {
                sleep_time: { type: :string },
                get_up_time: { type: ['null', 'string'] },
                duration: { type: ['null', 'string'] },
                created_at: { type: :string },
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
                }
              }
            },
          }
        }

        RESPONSE = {
          type: :object,
          properties: {
            data: SLEEP_OPERATION,
          }
        }

        LIST_RESPONSE = {
          type: :object,
          properties: {
            data: { 
              type: :array,
              items: SLEEP_OPERATION
            },
          }
        }
    end
  end
end
