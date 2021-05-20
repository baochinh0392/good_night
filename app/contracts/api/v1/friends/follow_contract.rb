# Friends::FollowContract for follow a friend
# frozen_string_literal: true
module Api
  module V1
    module Friends
      class FollowContract < BaseContract
        schema do
          required(:user_id)
          required(:friend_id)
        end
      end
    end
  end
end
