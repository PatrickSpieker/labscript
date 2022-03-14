class Text

  def initialize(lines)
    @lines = lines
  end

  def to_html
    output_html = "<p>"

    @lines.each do |l|
      output_html += l + "<br>"
    end

    output_html += "</p>"
  end

  def self.from_lines(lines)
    Text.new(lines)
  end
end
