FactoryBot.define do
  factory :sleep_operation do
    sleep_time { Time.current }
    get_up_time { Time.current + 8.hours }
    duration { 28800 }
  end
end
