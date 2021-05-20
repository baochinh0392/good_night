module V1
  module Users
    class BaseSerializer < BaseSerializer
      attribute :id, :name, :email
    end
  end
end