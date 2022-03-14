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

  def success?
    @incorrect.empty?
  end

  def time
    formats = @correct.map { |format| FORMATS[format]}
    Time.now.strftime(formats.join('-'))
  end
end