# Users::CreateContract for list action logs
# frozen_string_literal: true
module Api
  module V1
    module Users
      class CreateContract < BaseContract
        schema do
          required(:name)
          required(:email)
        end
      end
    end
  end
end
