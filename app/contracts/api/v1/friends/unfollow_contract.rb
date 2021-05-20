# Friends::UnfollowContract for unfollow a friend
# frozen_string_literal: true
module Api
  module V1
    module Friends
      class UnfollowContract < BaseContract
        schema do
          required(:user_id)
          required(:friend_id)
        end
      end
    end
  end
end
