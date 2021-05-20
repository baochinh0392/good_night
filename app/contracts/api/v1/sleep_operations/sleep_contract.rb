# SleepOperations::SleepContract for sleep
# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class SleepContract < BaseContract
        schema do
          required(:user_id)
          required(:sleep_time)
        end
      end
    end
  end
end
