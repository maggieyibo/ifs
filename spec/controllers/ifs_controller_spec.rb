require 'rails_helper'

RSpec.describe IfsController, :type => :controller do

  describe 'GET search' do
    it "is successful" do
      expect(response).to be_success
    end

    it "returns score given search_tag_weights" do
      post = Post.new(title: "Funny article title", body: "This is a funny paragraph")

      post.post_tag_weights << PostTagWeight.new(weight: 55)
      post.post_tag_weights << PostTagWeight.new(weight: 25)
      post.post_tag_weights << PostTagWeight.new(weight: 20)

      post.post_tag_weights[0].tag = Tag.new(name: "funny")
      post.post_tag_weights[1].tag = Tag.new(name: "pics")
      post.post_tag_weights[2].tag = Tag.new(name: "gifts")

      post.save

      search_tag_weights = [70,10,20]

      score = post.post_tag_weights[0].weight * search_tag_weights[0] + post.post_tag_weights[1].weight * search_tag_weights[1] + post.post_tag_weights[2].weight * search_tag_weights[2]

      expect(score).to eq(4500)
    end

  end

end
