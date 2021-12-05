Rails.application.configure do
  config.lograge.enabled = !Rails.env.test?
  config.lograge.logger = ActiveSupport::Logger.new(STDOUT)

  # JSON形式で出力
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  # 元のlogを残す
  config.lograge.keep_original_rails_log = true

  # 独自のパラメータを取得
  config.lograge.custom_payload do |controller|
    params = controller.request.params.except(* %w[controller action])

    {
      request_id: controller.request.request_id,
      params: params
    }
  end

  # 独自のパラメータを設定 (ActiveSupport::Notifications::Event name='process_action.action_controller')
  config.lograge.custom_options = lambda do |event|
    {
      time: Time.current,
      request_ip: event.payload[:request_ip],
      backtrace: event.payload[:exception_object].try(:backtrace),
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      user_agent: event.payload[:user_agent]
    }
  end
end
