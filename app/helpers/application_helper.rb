module ApplicationHelper
	def make_http(url)
		url.starts_with?("http://") ? url : url = "http://#{url}"
	end

	def betterdatetime(datetime)
		datetime.strftime("%m/%d/%Y 1:%M%P %Z")
	end

	

	
end
