class ApplicationController < ActionController::Base
  private

  # lograge用の情報
  def append_info_to_payload(payload)
    super
    payload[:host]       = request.host
    payload[:remote_ip]  = request.remote_ip
    payload[:user_agent] = request.user_agent
  end
end
