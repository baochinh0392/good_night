# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class SleepService < BaseService
        step :validate
        step :sleep

        private

        def validate(params)
          contract = SleepOperations::SleepContract.new
          result = contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure({ msgs: result.errors.to_h, status: 422 })
          end
        end

        def sleep(params)
          record = ::SleepOperation.new(params)
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
