# frozen_string_literal: true
module Api
  module V1
    module Friends
      class FollowService < BaseService
        step :validate
        step :follow

        private

        def validate(params)
          contract = Friends::FollowContract.new
          result = contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure({ msgs: result.errors.to_h, status: 422 })
          end
        end

        def follow(params)
          record = FollowFriend.where(params).first
          if record.present?
            Success(record)
          else
            record = ::FollowFriend.new(params)
            if record.save
              Success(record)
            else
              Failure({ msgs: record.errors.full_messages, status: 422 })
            end
          end
        end
      end
    end
  end
end
