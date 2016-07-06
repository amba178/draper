class UserDecorator < ApplicationDecorator 
  delegate_all 
  decorates_finders


  # def demonstrate_block(number)
 	#  yield(number)
  # end

  # puts demonstrate_block(1) { |number| number + 1 }


  def avatar 
  	site_link h.image_tag("avatars/#{avatar_name}", class: "avatar")
  end

  def linked_name
  	site_link(model.full_name.present? ? model.full_name : model.username)
  end

  def website
  	handle_none(model.url ){ h.link_to model.url, model.url }
  end

  def twitter
  	 handle_none(model.twitter_name) do 
      h.link_to model.twitter_name, "http://twitter.com/#{model.twitter_name}" 
    end 
  end

  def bio
    handle_none(model.bio) do 
    	h.raw markdown.render(model.bio)
	end
  end


private
	def handle_none(value)
		if value.present?
			yield
		else
			h.content_tag :span, "None given", class: "none"
		end
	end

	def site_link(content)
		h.link_to_if model.url.present?,content ,model.url
	end

	def avatar_name 
	    if model.avatar_image_name.present?
	      model.avatar_image_name
	    else
	      "default.png"
	    end
	end

end
