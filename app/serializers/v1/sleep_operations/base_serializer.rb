module V1
  module SleepOperations
    class BaseSerializer < BaseSerializer
      attribute :sleep_time, :get_up_time, :duration, :created_at
    end
  end
end