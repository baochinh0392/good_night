# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class ListFriendsService < BaseService
        step :validate
        step :sleep_operations

        private

        def validate(params)
          contract = SleepOperations::ListContract.new
          result = contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure({ msgs: result.errors.to_h, status: 422 })
          end
        end

        def sleep_operations(params)
          user = ::User.find(params[:user_id])
          if user.present?
            friend_ids = user.friends.pluck(:id)
            records = ::SleepOperation.where(user_id: friend_ids).order(duration: :desc)
            Success(records)
          else
            Failure({ msgs: 'CANT_GET_USER', status: 422 })
          end
        end
      end
    end
  end
end
