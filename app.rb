require_relative 'format'

class App

  def call(env)
    path = env['REQUEST_PATH']
    params = parse_query(env['QUERY_STRING'])
    process(path, params)
  end

  private

  def process(path, params)
    return response(404, "Wrong path") if path != '/time'
    time_response(params)
  end

  def time_response(params)
    format = Format.new(params)
    format.check_format
    
    if format.valid?
      response(200, format.success)
    else
      response(400, format.unknown_format)
    end
  end

  def response(status, body = "")
    headers = { 'Content-Type' => 'text/plain' }
    Rack::Response.new(body, status, headers).finish
  end

  def parse_query(query)
    query = query.gsub('%2C', ',')
    query.split('&').map { |s| s.split('=') }.to_h
  end
end