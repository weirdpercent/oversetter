# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	# Glosbe's service provides translations and examples.
	class Glosbe
		# @param search [String] The word or phrase to search for.
    # @param func [String] The search function to use.
    # @param params [Hash] The search parameters to use.
    # @param result [String] The search response.
    def get_word(search, func, params, result)
			search = URI.encode(search)
			prefix = 'https://glosbe.com/gapi/'
			word, pcont = "#{prefix}#{func}?", []
			if func == 'translate' then pcont.push "tm=false&"; end
      params.map { |k, v|
        if k == :src then pcont.push "from=#{v}&"; end
				if k == :tar then pcont.push "dest=#{v}&"; end
				if k == :page then pcont.push "page=#{v}&"; end
				if k == :size then pcont.push "pageSize=#{v}&"; end
      }
			pcont.push "phrase=#{search}&format=json&"
      url = "#{word}#{pcont.join}"
      request = HTTPI::Request.new(url)
      getter = HTTPI.get(request)
      result = getter.body
    end
  end
end
