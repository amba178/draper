class UserDecorator < Draper::Decorator
  delegate_all 
  decorates_finders


  def avatar 
  	h.link_to_if model.url.present?, h.image_tag("avatars/#{avatar_name}", class: "avatar"), model.url
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end

private
	def avatar_name 
	    if model.avatar_image_name.present?
	      model.avatar_image_name
	    else
	      "default.png"
	    end
	end
