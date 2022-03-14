require_relative("content_types.rb")

class Post
  attr_reader :post_id, :post_date, :post_title, :content_blocks

  def initialize(post_id, post_title, post_date, content_blocks)
    @post_id = post_id
    @post_date = post_date
    @post_title = post_title
    @content_blocks = content_blocks
  end

  def self.from_string(post_string)
    # split on \n
    # ensure the post metadata is there
    raw_lines = post_string.strip # removing whitespace linked to the string
      .split("\n") # splitting on newlines

    # require 'pry-byebug'; binding.pry
    raise StandardError.new("Malformed post string") if raw_lines.length < 3

    # first line should be the title
    first_line = raw_lines[0]
    # require 'pry-byebug'; binding.pry
    raise StandardError.new("No post title found!") if first_line[0..11] != "post-title: "
    post_title = first_line[12..].strip

    # second line should be the date
    second_line = raw_lines[1]
    raise StandardError.new("No post date found!") if second_line[0..10] != "post-date: "
    post_date = second_line[11..].strip

    # third line should be the ID
    third_line = raw_lines[2]
    raise StandardError.new("No post ID found!") if third_line[0..8] != "post-id: "
    post_id = third_line[9..].strip

    # Great, so now that first 3 lines are properly formatted, we'll turn the remaining lines into Content blocks

    content_lines = raw_lines[3..]
    lines_to_block_mapping = ContentType.get_lines_to_type_mapping(content_lines)

    content_blocks = lines_to_block_mapping.map do |range, content_type|
      content_type.from_lines(
        content_lines[range[0]..range[1]]
      )
    end
    # require 'pry-byebug'; binding.pry

    new(
      post_id,
      post_title,
      post_date,
      content_blocks 
    )
  end

  def to_html
    "<div>
    <h2>#{@post_title}</h2>
    <h4>#{@post_date}</h4>

    #{content_blocks_html}
    </div>"
  end

  private def content_blocks_html
    @content_blocks.reduce("") do |agg, content|
      agg + content.to_html
    end
  end
end
