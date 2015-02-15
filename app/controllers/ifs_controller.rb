class IfsController < ApplicationController

	# the master controller for the IFS form view page

	def main
		render
	end

  def search
    post_weights_array = []
    
    search_weights = []
    
    # split the tag weights into an array
    params[:tagWeights].split(',').each do |o|
      search_weights << o
    end
    
    # get all the posts
    posts = Post.all

    # for each post
    posts.each do |p|
      
      # start with a score of zero
      score = 0

      # for each weighted tag on the post
      p.post_tag_weights.each do |ptw|

        # look through the weights sent from the user
        search_weights.each do |o|

          # split the tag id from the weight (note: move out of loop)
          key, value = o.split(/:/).map {|num| num.to_i}

          # if we have a matching tag...
          if key == ptw.tag_id

            # multiply by post tag weight and add it to the score
            score += ptw.weight * value          
          end
        end
      end

      if score > 0
        post_weights_array << {post_id: p.id, post_title: p.title, post_body: p.body, comments: p.comments, tags: p.tags, score: score}
      end

    end

    # send the json back to the browser 
    render json: post_weights_array

  end

end
