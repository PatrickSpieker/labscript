
require("post.rb")
RSpec.describe Post do
  it 'parses from a set of lines' do
    post_string = File.read("fixtures/example_post.txt")

    post = Post.from_string(post_string)
    expect(3).to eq(post.content_blocks.length)
    expect("2022-03-09").to eq(post.post_date)
    expect("example-post").to eq(post.post_id)
    expect("This Is An Example Post").to eq(post.post_title)
    require 'pry-byebug'; binding.pry
  end
end
