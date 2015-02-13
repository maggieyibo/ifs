class IfsController < ApplicationController

	# the master controller for the IFS form view page

	def main
		render
	end

  def search
    post_weights_array = []
    
    search_weights = []

    params[:tagWeights].split(',').each do |o|
      search_weights << o
    end
    
    posts = Post.all

    posts.each do |p|
      score = 0
      p.post_tag_weights.each do |ptw|
        search_weights.each do |o|
          key, value = o.split(/:/).map {|num| num.to_i}
          if key == ptw.tag_id
            score += ptw.weight * value          
          end
        end
      end
      if score > 0
        post_weights_array << {post_id: p.id, post_title: p.title, post_body: p.body, comments: p.comments, tags: p.tags, score: score}
      end
    end

    render json: post_weights_array
  end

end
