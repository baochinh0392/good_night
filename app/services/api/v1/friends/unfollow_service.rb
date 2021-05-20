# frozen_string_literal: true
module Api
  module V1
    module Friends
      class UnfollowService < BaseService
        step :validate
        step :unfollow

        private

        def validate(params)
          contract = Friends::UnfollowContract.new
          result = contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure({ msgs: result.errors.to_h, status: 422 })
          end
        end

        def unfollow(params)
          record = ::FollowFriend.where(params)
          if record.destroy_all
            Success(record)
          else
            Failure({ msgs: record.errors.full_messages, status: 422 })
          end
        end
      end
    end
  end
end
