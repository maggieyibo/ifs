require 'rails_helper'

RSpec.describe IfsController, :type => :controller do

  describe 'GET search' do
    it "is successful" do
      expect(response).to be_success
    end

    it "returns post_tag_weights from within posts" do
      post = Post.new(title: "Funny article title", body: "This is a funny paragraph")

      post.post_tag_weights << PostTagWeight.new(weight: 55)
      post.post_tag_weights << PostTagWeight.new(weight: 25)
      post.post_tag_weights << PostTagWeight.new(weight: 20)

      post.post_tag_weights[0].tag = Tag.new(name: "funny")
      post.post_tag_weights[1].tag = Tag.new(name: "pics")
      post.post_tag_weights[2].tag = Tag.new(name: "gifts")

      post.save

      expect(post.post_tag_weights[0].weight).to eq(55)
      expect(post.post_tag_weights[1].weight).to eq(25)
      expect(post.post_tag_weights[2].weight).to eq(20)
    end

  end

end
