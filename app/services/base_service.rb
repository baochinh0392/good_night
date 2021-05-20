# frozen_string_literal: true
require "dry/transaction"

class BaseService
  include Dry::Transaction
end