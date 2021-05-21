describe 'Users API' do
  path '/api/v1/users' do
    post 'Create an user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_params, in: :body, description: 'The user params to create.', schema: V1::SwaggerSchemas::Users::PARAMS

      response '200', 'User is created' do
        schema(V1::SwaggerSchemas::Users::RESPONSE)
        let(:user_params){
          {
            "name": Faker::Name.name,
            "email": Faker::Internet.unique.email
          }
        }

        run_test!
      end
    end
  end
end