module V1
  module Friends
    class BaseSerializer < BaseSerializer
      attribute :user do |object|
        V1::Users::BaseSerializer.new(object.user)
      end
      attribute :friend do |object|
        V1::Users::BaseSerializer.new(object.friend)
      end
    end
  end
end