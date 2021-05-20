# frozen_string_literal: true
class Api::V1::SleepOperationsController < Api::V1::BaseController
  def index
    Api::V1::SleepOperations::ListContract.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def sleep
    Api::V1::SleepOperations::SleepService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def get_up
    Api::V1::SleepOperations::GetUpService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def friends_sleep
    Api::V1::SleepOperations::ListFriendsContract.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end
end