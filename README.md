# LabScript!
LabScript is a very, very simple markdown (up?) language that I can compile to HTML. The goal was to create a very simple language to write little blog posts in, 
as well as to test out what building a little parser / compiler is like. 

As of this post, LabScript supports 3 kinds of content blocks:
* Text
* Code Blocks
* Photos

This repo contains a Ruby parser implementation.

Alternatives considered:
- Jekyll (markdown files -> HTML): this is probably the right choice - but it felt heavy to be honest. I didn't want to deal with writing pure markdown in Vim (too many seductive tools for viewing / editing). 
- Writing raw HTML: also would work but too much cognitive load. 
- Blogger / WordPress / choose-your-own-blog-service: I was concerned I wouldn't understand the abstractions from first principles, or that by the time I did they'd have shifted significantly under my feet. Also, would have to convert my static site onto some kind of hosted service.<br><br>Next steps will be adding footnote support to the Text content block - also may write a LabScript parser in OCaml / some functional language as a nice contrast to my hacky implementation in Ruby. <br><br>[0] github link here<br></p>
