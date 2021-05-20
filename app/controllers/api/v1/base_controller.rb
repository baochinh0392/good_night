# frozen_string_literal: true
class Api::V1::BaseController < ApplicationController
  def parameters
    params.permit!
  end
end