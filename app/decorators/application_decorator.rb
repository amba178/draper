class ApplicationDecorator < Draper::Decorator 


	def markdown
		Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    	                              autolink: true, tables: true)
	end
end