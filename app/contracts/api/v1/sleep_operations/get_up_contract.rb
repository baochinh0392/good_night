# SleepOperations::GetUpContract for get up
# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class GetUpContract < BaseContract
        schema do
          required(:user_id)
          required(:get_up_time)
        end
      end
    end
  end
end
