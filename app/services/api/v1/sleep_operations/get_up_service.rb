# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class GetUpService < BaseService
        step :validate
        step :get_up

        private

        def validate(params)
          contract = SleepOperations::GetUpContract.new
          result = contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure({ msgs: result.errors.to_h, status: 422 })
          end
        end

        def get_up(params)
          record = ::SleepOperation.where(user_id: params[:user_id]).last
          record[:duration] =  params[:get_up_time].to_time - record.sleep_time.to_time
          if record.update(params)
            Success(record)
          else
            Failure({ msgs: record.errors.full_messages, status: 422 })
          end
        end
      end
    end
  end
end
