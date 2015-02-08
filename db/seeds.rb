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

# create posts
100.times do
  p = Post.create(title: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun} #{Faker::Hacker.verb} #{Faker::Hacker.noun}", body: Faker::Lorem.paragraph(10, false, 10))
  
  # creat comments
  rand(0..8).times do
    c = Comment.create(body: Faker::Hacker.say_something_smart, votes_score: rand(0..100))
    p.comments << c
  end

  # create some tags with weight
  total_weight = 100

  while total_weight > 0 do
    t = Tag.all.sample

    weight = rand(0..100)
    total_weight -= weight

    # make sure last weight gets us to 0
    if total_weight < 0 
      weight += total_weight
    end

    ptw = PostTagWeight.create(weight: weight)
    ptw.post = p
    ptw.tag = t
    ptw.save
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