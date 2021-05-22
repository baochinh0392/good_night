describe 'Friends API' do
  path '/api/v1/users/{user_id}/friends/follow' do
    post 'Follow a friend' do
      tags 'Friends'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_id, in: :path, required: true, type: :string, description: 'Id of user'
      parameter name: :params, in: :body, description: 'The user params to follow a friend.', schema: V1::SwaggerSchemas::Friends::FRIEND_PARAMS

      response '200', 'Follow a friend is recorded' do
        schema(V1::SwaggerSchemas::Friends::FRIEND_RESPONSE)
        include_context 'Create an user'
        let(:user_id){ user.id }
        let(:params) {
          {
            friend_id: user2.id
          }
        }

        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/friends/unfollow' do
    post 'Follow a friend' do
      tags 'Friends'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_id, in: :path, required: true, type: :string, description: 'Id of user'
      parameter name: :params, in: :body, description: 'The user params to unfollow a friend.', schema: V1::SwaggerSchemas::Friends::FRIEND_PARAMS

      response '200', 'Unfollow a friend is recorded' do
        schema(V1::SwaggerSchemas::Friends::FRIEND_RESPONSE)
        include_context 'Create an user'
        let(:user_id){ user.id }
        let(:params) {
          {
            friend_id: user2.id
          }
        }

        run_test!
      end
    end
  end
end