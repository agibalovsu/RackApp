class Format

  FORMATS = { "year"   => "%Y",
              "month"  => "%m",
              "day"    => "%d",
              "hour"   => "%h",
              "minute" => "%M",
              "second" => "%s" }.freeze

  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
    @correct = []
    @incorrect = []
  end

  def check_format
    @params.map do |format| 
      if FORMATS.include?(format)
        @correct << FORMATS[format]
      else 
        @incorrect << format
      end
    end
  end

  def valid?
    @incorrect.empty?
  end

  def unknown_format
    body = "Unknown time format #{@incorrect}"
  end

  def success
    Time.now.strftime(@correct.join('-'))
  end
end
