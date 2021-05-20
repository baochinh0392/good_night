# SleepOperations::ListContract for list sleep operations
# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class ListContract < BaseContract
        schema do
          required(:user_id)
        end
      end
    end
  end
end
