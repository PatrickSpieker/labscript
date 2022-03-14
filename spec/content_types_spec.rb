require "content_types"

RSpec.describe ContentType do
  it 'makes memes' do
    first_post_lines = File.read("fixtures/example_post.txt").split("\n")[3..]
    ass_arr = ContentType.get_lines_to_type_mapping(first_post_lines)
    require 'pry-byebug'; binding.pry
    expect([
      [[0,5], Text],
      [[6,12], CodeBlock],
      [[13,15], Text],
    ],
    ).to eq(ass_arr)
  end
  it 'makes memes again with a photo' do
    second_post_lines = File.read("fixtures/other_example_post.txt").split("\n")[3..]
    ass_arr = ContentType.get_lines_to_type_mapping(second_post_lines)
    require 'pry-byebug'; binding.pry
    expect([
      [[0,5], Text],
      [[6,6], Photo],
    ]).to eq(
      ass_arr
    )
  end
end
