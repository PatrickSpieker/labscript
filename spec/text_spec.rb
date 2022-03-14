require "text"

RSpec.describe Text do
  it 'makes memes' do
    text = Text.from_lines(["This is a meme", "This is another meme"])
    expect(text.to_html).to(
      eq(
        "<p>This is a meme<br>This is another meme<br></p>"
      )
    )
  end
end
