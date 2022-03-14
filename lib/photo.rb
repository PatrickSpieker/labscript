
class Photo
  def initialize(asset_path)
    @asset_path = asset_path
  end

  def self.from_lines(lines)
    raise StandardError.new("More than one line") if lines.length > 1
    raw_line = lines[0]
    raise StandandError.new("Misformatted asset path") if \
      raw_line[0..1] != "[[" && \
      raw_line[-2..-1] != "]]"

    asset_path = raw_line.gsub("[", "").gsub("]", "")

    new(
      asset_path
    )
  end

  def to_html
    "<img src=\"#{@asset_path}\">"
  end
end
