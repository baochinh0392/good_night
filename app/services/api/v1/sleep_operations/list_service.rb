# frozen_string_literal: true
module Api
  module V1
    module SleepOperations
      class ListService < BaseService
        step :validate
        step :list

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

        def list(params)
          records = ::SleepOperation.where(user_id: params[:user_id]).order(duration: :desc)
          Success(records)
        end
      end
    end
  end
end
