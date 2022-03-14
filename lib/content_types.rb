require_relative('text.rb')
require_relative('code_block.rb')
require_relative('photo.rb')

module ContentType
  TEXT = Text
  CODE_BLOCK = CodeBlock
  PHOTO = Photo

  # takes: an array of lines
  # returns an associative arrayof 
  # two item array (a range, inclusive), the content type
  def self.get_lines_to_type_mapping(lines)
    index_range_to_content_block = []
    current_line_index = 0

    while current_line_index < lines.length
      current_line = lines[current_line_index].strip

      # look at current line -> determine what kind of content block you're about to parse
      # require 'pry-byebug'; binding.pry
      case current_line
      when "```" # matching a Code Block
        code_block_end_index = current_line_index + 1
        while lines[code_block_end_index] != "```" && code_block_end_index < lines.length
          code_block_end_index += 1 # searching for ```
        end

        # parse until we find ```
        index_range_to_content_block.append(
          [[current_line_index, code_block_end_index], CodeBlock]
        )
        current_line_index = code_block_end_index + 1
      when /^\[\[.*\]\]$/ # matching a Photo
        # a photo must exist on precisely one line
        index_range_to_content_block.append(
          [[current_line_index, current_line_index], Photo]
        )
        current_line_index += 1
      else # Must be of type text
        next_block_start_index = current_line_index + 1
        while !(lines[next_block_start_index] == "```" || /^\[\[.*\]\]$/ === lines[next_block_start_index])\
            && next_block_start_index < lines.length
          next_block_start_index += 1
        end
        # when this breaks, we either have hit the end of the file 
        index_range_to_content_block.append(
          [[current_line_index, next_block_start_index - 1], Text]
        )
        # require 'pry-byebug'; binding.pry
        current_line_index = next_block_start_index
      end
    end
    index_range_to_content_block 
  end
end
