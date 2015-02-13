require 'rails_helper'

RSpec.describe IfsController, :type => :controller do

  describe 'GET search' do
    let!(:ptw1) {PostTagWeight.new(weight: 55)}


    it "is successful" do
      expect(response).to be_success
    end

    it "returns post with correct score given tag weights" do

      post = Post.create(title: "Funny article title", body: "This is a funny paragraph")

      post.tags << Tag.new(name: "funny").weights
      post.tags << Tag.new(name: "pics")
      post.tags << Tag.new(name: "gifs")

      post.tags[0] = 
      post.tags[1] = PostTagWeight.new(weight: 25)
      post.tags[2] = PostTagWeight.new(weight: 20)

      puts post.to_json(include: :post_tag_weights)
      # expect(post.post_tag_weights['weights']).eq to(55)
    end


    it "renders post_weights_array json"


  end

end
