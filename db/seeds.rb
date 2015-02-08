Tag.create(name: "funny")
Tag.create(name: "pics")
Tag.create(name: "gifs")
Tag.create(name: "videos")
Tag.create(name: "gaming")
Tag.create(name: "javascript")
Tag.create(name: "angularjs")
Tag.create(name: "ruby")
Tag.create(name: "rails")
Tag.create(name: "news")
Tag.create(name: "trees")
Tag.create(name: "movies")
Tag.create(name: "technology")
Tag.create(name: "self-help")
Tag.create(name: "soccer")
Tag.create(name: "politics")
Tag.create(name: "atheism")
Tag.create(name: "jokes")
Tag.create(name: "science")
Tag.create(name: "GA")
Tag.create(name: "WDI")

10.times do
  p = Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10, false, 10))
  rand(0..8).times do
    c = Comment.create(body: Faker::Lorem.paragraph(4))
    p.comments << c
  end
  3.times do
    w = PostTagWeight.create(weight: rand(0..100))
  	w.post = p
  	t = Tag.all.sample
  	w.tag = t
  	w.save
  end
end

# require 'httparty'
# require 'hashie'

# response = HTTParty.get 'http://www.reddit.com/r/javascript.json'

# # puts response
# parsed = JSON.parse response.body

# # puts parsed
# post = Hashie::Mash.new parsed


# (0...10).each do |i|
#   puts post.data.children[i].data.title
#   comments_response = HTTParty.get "http://www.reddit.com#{post.data.children[i].data.permalink}"
#   parsed_comments = JSON.parse comments_response.body
#   comment = Hashie::Mash.new parsed_comments
#   comment.data.
# end

# puts post.data.children[0].data.url