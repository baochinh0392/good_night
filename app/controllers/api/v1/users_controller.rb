# frozen_string_literal: true
class Api::V1::UsersController < Api::V1::BaseController
  def create
    debugger
    Api::V1::Users::CreateService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end
end