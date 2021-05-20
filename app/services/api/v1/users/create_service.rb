# frozen_string_literal: true
module Api
  module V1
    module Users
      class CreateService < BaseService
        step :validate
        step :create

        private

        def validate(params)
          contract = Users::CreateContract.new
          result = contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure(result.errors.to_h)
          end
        end

        def create(params)
          record = ::User.new(params)
          if record.save
            Success(record)
          else
            Failure({ msgs: record.errors.full_messages, status: 500 })
          end
        end
      end
    end
  end
end
