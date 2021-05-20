# frozen_string_literal: true
module JsonResponder
  def json_response(data, status: :ok)
    render(json: data, status: status)
  end

  def json_error_response(errors, status: :unprocessable_entity)
    json_response({ messages: errors }, status: status)
  end
end
