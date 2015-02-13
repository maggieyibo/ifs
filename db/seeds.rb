# fake tags taken from top 125 reddit subs
Tag.create(name: "funny")
Tag.create(name: "AskReddit")
Tag.create(name: "pics")
Tag.create(name: "todayilearned")
Tag.create(name: "worldnews")
Tag.create(name: "science")
Tag.create(name: "IAmA")
Tag.create(name: "videos")
Tag.create(name: "gaming")
Tag.create(name: "movies")
Tag.create(name: "Music")
Tag.create(name: "aww")
Tag.create(name: "technology")
Tag.create(name: "news")
Tag.create(name: "bestof")
Tag.create(name: "gifs")
Tag.create(name: "askscience")
Tag.create(name: "WTF")
Tag.create(name: "explainlikeimfive")
Tag.create(name: "AdviceAnimals")
Tag.create(name: "EarthPorn")
Tag.create(name: "books")
Tag.create(name: "television")
Tag.create(name: "politics")
Tag.create(name: "LifeProTips")
Tag.create(name: "sports")
Tag.create(name: "mildlyinteresting")
Tag.create(name: "DIY")
Tag.create(name: "Fitness")
Tag.create(name: "space")
Tag.create(name: "Showerthoughts")
Tag.create(name: "Jokes")
Tag.create(name: "food")
Tag.create(name: "tifu")
Tag.create(name: "photoshopbattles")
Tag.create(name: "InternetIsBeautiful")
Tag.create(name: "GetMotivated")
Tag.create(name: "nottheonion")
Tag.create(name: "history")
Tag.create(name: "gadgets")
Tag.create(name: "dataisbeautiful")
Tag.create(name: "Futurology")
Tag.create(name: "Documentaries")
Tag.create(name: "listentothis")
Tag.create(name: "personalfinance")
Tag.create(name: "nosleep")
Tag.create(name: "philosophy")
Tag.create(name: "Art")
Tag.create(name: "creepy")
Tag.create(name: "OldSchoolCool")
Tag.create(name: "UpliftingNews")
Tag.create(name: "WritingPrompts")
Tag.create(name: "TwoXChromosomes")
Tag.create(name: "atheism")
Tag.create(name: "woahdude")
Tag.create(name: "trees")
Tag.create(name: "leagueoflegends")
Tag.create(name: "4chan")
Tag.create(name: "programming")
Tag.create(name: "fffffffuuuuuuuuuuuu")
Tag.create(name: "Games")
Tag.create(name: "sex")
Tag.create(name: "Android")
Tag.create(name: "reactiongifs")
Tag.create(name: "cringepics")
Tag.create(name: "gameofthrones")
Tag.create(name: "malefashionadvice")
Tag.create(name: "Frugal")
Tag.create(name: "YouShouldKnow")
Tag.create(name: "Minecraft")
Tag.create(name: "pokemon")
Tag.create(name: "HistoryPorn")
Tag.create(name: "comics")
Tag.create(name: "AskHistorians")
Tag.create(name: "lifehacks")
Tag.create(name: "nfl")
Tag.create(name: "tattoos")
Tag.create(name: "interestingasfuck")
Tag.create(name: "FoodPorn")
Tag.create(name: "JusticePorn")
Tag.create(name: "facepalm")
Tag.create(name: "Unexpected")
Tag.create(name: "wheredidthesodago")
Tag.create(name: "TrueReddit")
Tag.create(name: "wallpapers")
Tag.create(name: "pcmasterrace")
Tag.create(name: "soccer")
Tag.create(name: "cringe")
Tag.create(name: "gentlemanboners")
Tag.create(name: "freebies")
Tag.create(name: "offbeat")
Tag.create(name: "humor")
Tag.create(name: "GameDeals")
Tag.create(name: "Cooking")
Tag.create(name: "conspiracy")
Tag.create(name: "geek")
Tag.create(name: "relationships")
Tag.create(name: "skyrim")
Tag.create(name: "buildapc")
Tag.create(name: "oddlysatisfying")
Tag.create(name: "AbandonedPorn")
Tag.create(name: "spaceporn")
Tag.create(name: "loseit")
Tag.create(name: "hiphopheads")
Tag.create(name: "firstworldanarchists")
Tag.create(name: "cats")
Tag.create(name: "nba")
Tag.create(name: "anime")
Tag.create(name: "apple")
Tag.create(name: "europe")
Tag.create(name: "DoesAnybodyElse")
Tag.create(name: "FiftyFifty")
Tag.create(name: "RoomPorn")
Tag.create(name: "talesfromtechsupport")
Tag.create(name: "StarWars")
Tag.create(name: "QuotesPorn")
Tag.create(name: "NetflixBestOf")
Tag.create(name: "circlejerk")
Tag.create(name: "doctorwho")
Tag.create(name: "MakeupAddiction")
Tag.create(name: "wow")
Tag.create(name: "photography")
Tag.create(name: "breakingbad")
Tag.create(name: "shittyaskscience")
Tag.create(name: "shutupandtakemymoney")
Tag.create(name: "GA")
Tag.create(name: "WDI")

# create posts
500.times do
  p = Post.create(title: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun} #{Faker::Hacker.verb} #{Faker::Hacker.noun}", body: Faker::Lorem.paragraph(10, false, 10))
  
  # creat comments
  rand(0..12).times do
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