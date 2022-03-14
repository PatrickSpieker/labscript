require_relative("parser.rb")

input_labn_filepath = ARGV[0]
output_html_filepath = ARGV[1]

parser = LabScriptParser.from_file(input_labn_filepath)

File.open(output_html_filepath, "w") do |f|
  f.write(parser.to_html)
end

