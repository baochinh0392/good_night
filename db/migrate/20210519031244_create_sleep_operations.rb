class CreateSleepOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :sleep_operations do |t|
      t.references :user
      t.datetime :sleep_time
      t.datetime :get_up_time
      t.float :duration, default: 0

      t.timestamps
    end
  end
end
