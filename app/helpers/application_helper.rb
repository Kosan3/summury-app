module ApplicationHelper
	def full_title(page_title = '')
		base = 'SAITAMA'
		if page_title.empty?
			base
		else
			page_title + ' | ' + base
		end
	end
end
