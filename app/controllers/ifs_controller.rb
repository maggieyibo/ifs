class IfsController < ApplicationController
	# the master controller for the ifs form view page
	def main
		render
	end

  def search
    post_weights_array = []
    
    search_weights = []

    params[:tagWeights].split(',').each do |o|
      search_weights << o
    end
    # params[:tagWeights].split(',').each do |pair|
    #   hash = {}
    #   key, value = pair.split(/:/)
    #   hash[key] = value.to_i
    #   search_weight << hash
    # end

    puts "-----------------"
    puts search_weights
    puts "-----------------"

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
        post_weights_array << {"#{p.id}": score}
      end
    
    end

    render json: post_weights_array
  end

end
