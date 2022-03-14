
require_relative("lib/post.rb")

class LabScriptParser
  def initialize(posts)
    @posts = posts
  end


  def to_html
    html_string = """
    <html>
      <head>
        <link rel='stylesheet' href='style.css'>
      </head>
      <body>
    """
    @posts.each do |p| 
      html_string += p.to_html
    end
    html_string += "</body></html>"
    # format(html_string)
    html_string
  end

  def self.from_file(filepath)
    post_strings = File.read(filepath).strip.split("-" * 50).reject(&:empty?)
    posts = post_strings.map do |s| 
      Post.from_string(s.strip)
    end
    new(
      posts
    )
  end
end

