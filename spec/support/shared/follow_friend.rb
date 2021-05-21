RSpec.shared_context 'Create a friend connection' do
  let!(:follow_friend){ create(:follow_friend, user: user, friend: user2) }
  let!(:follow_friend2){ create(:follow_friend, user: user2, friend: user) }
end