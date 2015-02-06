class IfsController < ApplicationController
	# the master controller for the ifs form view page
	def main
		render
	end

  def search
    post_weights_array = []

    search_weight = {'1': 40, '2': 20, '3': 35, '4': 5}
    posts = Post.all

    posts.each do |p|
      score = 0
      p.post_tag_weights.each do |ptw|
        puts ptw.tag_id
        if search_weight[:"#{ptw.tag_id}"] != nil
          score += ptw.weight * search_weight[:"#{ptw.tag_id}"]
        end
      end
      post_weights_array << {'#{p.id}': score}
    end

    render json: post_weights_array
  end

end
