
class CodeBlock
  def initialize(lines)
    @code_lines = lines.reject {|l| l == '```'}
  end

  def self.from_lines(lines)
    new(
      lines
    )
  end

  def to_html
    # require 'pry-byebug'; binding.pry
    code_content = @code_lines.reduce("\n") do |acc, ele|
      acc += ele + "\n"; acc
    end
    """
    <pre><code>
    #{code_content}
    </code></pre>
    """
  end
end
