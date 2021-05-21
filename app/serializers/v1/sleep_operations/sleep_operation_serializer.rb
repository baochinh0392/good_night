module V1
  module SleepOperations
    class SleepOperationSerializer < V1::SleepOperations::BaseSerializer
      attribute :user do |object|
        V1::Users::BaseSerializer.new(object.user)
      end
    end
  end
end