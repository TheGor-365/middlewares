class RequestTimeLogger
  attr_reader :app, :logger_identificator

  def initialize(app, logger_identificator = '*')
    @app = app
    @logger_identificator = logger_identificator
  end

  def call env
    dup._call env
  end

  def _call env
    request_received_at = Time.now

    @status, @headers, @response = app.call env

    request_hendled_at = Time.now
    beauty_logging(request_hendled_at - request_received_at)

    [ @status, @headers, @response ]
  end

  private

  def beauty_logging time
    Rails.logger.debug(logger_identificator * 50)
    Rails.logger.debug("Request time: #{time}")
    Rails.logger.debug(logger_identificator * 50)
  end
end
