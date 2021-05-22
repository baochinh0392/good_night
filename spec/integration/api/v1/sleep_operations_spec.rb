describe 'Sleep Operations API' do
  path '/api/v1/users/{user_id}/sleep_operations/sleep' do
    post 'Create a sleep operation' do
      tags 'Sleep Operations'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_id, in: :path, required: true, type: :string, description: 'Id of user'
      parameter name: :sleep_params, in: :body, description: 'The user params to create sleep operation.', schema: V1::SwaggerSchemas::SleepOperations::SLEEP_PARAMS

      response '200', 'Sleep time is recorded' do
        schema(V1::SwaggerSchemas::SleepOperations::RESPONSE)
        include_context 'Create an user'
        let(:user_id){ user.id }
        let(:sleep_params) {
          {
            sleep_time: Time.now
          }
        }

        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/sleep_operations/get_up' do
    post 'Update a sleep operation' do
      tags 'Sleep Operations'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_id, in: :path, required: true, type: :string, description: 'Id of user'
      parameter name: :get_up_params, in: :body, description: 'The user params to update the sleep record.', schema: V1::SwaggerSchemas::SleepOperations::GET_UP_PARAMS

      response '200', 'Get up time is recorded' do
        schema(V1::SwaggerSchemas::SleepOperations::RESPONSE)
        include_context 'Create an user'
        let(:user_id){ user.id }
        let(:get_up_params) {
          {
            get_up_time: Time.now + 8.hours
          }
        }

        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/sleep_operations' do
    get 'Get list sleep operations' do
      tags 'Sleep Operations'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_id, in: :path, required: true, type: :string, description: 'Id of user'

      response '200', 'Sleep operations are listed' do
        schema(V1::SwaggerSchemas::SleepOperations::LIST_RESPONSE)
        include_context 'Create an user'
        include_context 'Create an sleep operation'
        let(:user_id){ user.id }

        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/sleep_operations/list_friends' do
    get 'Get list sleep operations of friends' do
      tags 'Sleep Operations'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_id, in: :path, required: true, type: :string, description: 'Id of user'

      response '200', 'Sleep operations of friends are listed' do
        schema(V1::SwaggerSchemas::SleepOperations::LIST_RESPONSE)
        include_context 'Create an user'
        include_context 'Create an sleep operation'
        include_context 'Create a friend connection'
        let(:user_id){ user.id }

        run_test!
      end
    end
  end
end