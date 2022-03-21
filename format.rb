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
    @correct, @incorrect = @params.partition { |format| FORMATS[format] }
  end

  def valid?
    @incorrect.empty?
  end

  def unknown_format
    @body = "Unknown time format #{@incorrect}"
  end

  def success
    formats = @correct.map { |format| FORMATS[format]}
    Time.now.strftime(formats.join('-'))
  end
end