require_relative 'format'

class App

  def call(env)
    @request = Rack::Request.new(env)
    response
    [status, headers, body]
  end

  private

  def response
    return wrong_path unless @request.path_info == '/time'

    @format = Format.new(@request.params)
    @format.check_format
    return unknown_format unless @format.success?

    formatted_time
  end

  def status
    @status_code
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ["#{@message}"]
  end

  def formatted_time
    @status_code = 200
    @message = @format.time
  end

  def unknown_format
    @status_code = 400
    @message = "Unknown time format #{@incorrect}"
  end

  def wrong_path
    @status_code = 404
    @message = 'Page not found'
  end
end