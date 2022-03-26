class Format

  FORMATS = { "year"   => "%Y",
              "month"  => "%m",
              "day"    => "%d",
              "hour"   => "%h",
              "minute" => "%Mm",
              "second" => "%s" }.freeze

  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
  end

  def check_format
    @correct = @params.map { |format| FORMATS[format] }
    @incorrect = @params.reject { |format| FORMATS[format] }
  end

  def valid?
    @incorrect.empty?
  end

  def unknown_format
    @body = "Unknown time format #{@incorrect}"
  end

  def success
    Time.now.strftime(@correct.join('-'))
  end
end