# SleepOperations::ListFriendsContract for list sleep operations of friends
# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class ListFriendsContract < BaseContract
        schema do
          required(:user_id)
        end
      end
    end
  end
end
