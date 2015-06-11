# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	# Hablaa.com's service provides translations, examples, and similar translations.
	class Hablaa
		# Fetches dynamically generated URL. Functions are translation, translations-examples,
		# translations-similar, and languages.
		#
		# @param search [String] The word or phrase to search for.
    # @param func [String] The search function to use.
    # @param params [Hash] The search parameters to use.
    # @param result [String] The search response.
    def get_word(search, func, params, result)
			search = URI.encode(search)
			prefix = 'http://hablaa.com/hs/'
			if func == 'languages'
				url = "#{prefix}#{func}/"
			else
				url = "#{prefix}#{func}/#{search}/#{params[:src]}-#{params[:tar]}/"
			end
			request = HTTPI::Request.new(url)
      getter = HTTPI.get(request)
			header = getter.headers
			ctype = header['content-type']
			if ctype == 'text/html; charset=utf-8'
      	result = getter.body
			else
				result = 'error'
			end
		end
	end
end
