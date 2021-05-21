RSpec.shared_context 'Create an user' do
  let!(:user){ create(:user) }
  let!(:user2){ create(:user) }
end