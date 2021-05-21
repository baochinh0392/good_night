RSpec.shared_context 'Create an sleep operation' do
  let!(:sleep_operation){ create(:sleep_operation, user: user) }
  let!(:sleep_operation2){ create(:sleep_operation, user: user2) }
end