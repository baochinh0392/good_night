# frozen_string_literal: true
class Api::V1::SleepOperationsController < Api::V1::BaseController
  def index
    Api::V1::SleepOperations::ListService.new.call(parameters) do |response|
      response.success do |data|
        pagy, records = pagy(data)
        json_response(V1::SleepOperations::SleepOperationSerializer.new(data, meta: pagy_metadata(pagy)))
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def sleep
    Api::V1::SleepOperations::SleepService.new.call(parameters) do |response|
      response.success do |data|
        json_response(V1::SleepOperations::SleepOperationSerializer.new(data))
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def get_up
    Api::V1::SleepOperations::GetUpService.new.call(parameters) do |response|
      response.success do |data|
        json_response(V1::SleepOperations::SleepOperationSerializer.new(data))
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def list_friends
    Api::V1::SleepOperations::ListFriendsService.new.call(parameters) do |response|
      response.success do |data|
        pagy, records = pagy(data)
        json_response(V1::SleepOperations::SleepOperationSerializer.new(data, meta: pagy_metadata(pagy)))
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end
end