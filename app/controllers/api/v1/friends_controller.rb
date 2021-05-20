# frozen_string_literal: true
class Api::V1::FriendsController < Api::V1::BaseController
  def follow
    Api::V1::Friends::FollowService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end

  def unfollow
    Api::V1::Friends::UnfollowService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error[:msgs], status: error[:status])
      end
    end
  end
end